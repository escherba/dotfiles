Using Jupyter Lab with Docker on Nvidia GPU instances
-----------------------------------------------------

Basic set up on Ubuntu
~~~~~~~~~~~~~~~~~~~~~~

Installing Docker CE (this follows `[1]`_)::

  # First, remove old versions of Docker
  sudo apt-get remove -y docker docker-engine docker.io

  # Next, add Docker Repository
  sudo apt-get update
  sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' | sudo apt-key add -
  sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"

  # Install Docker CE
  sudo apt-get update
  sudo apt-get install -y docker-ce

  # Verify the Docker installation
  sudo docker run hello-world	

Installing Nvidia-Docker::

  # First, purge all of the old docker versions and containers.
  sudo docker volume ls -q -f driver=nvidia-docker \
      | xargs -r -I{} -n1 docker ps -q -a -f volume={} \
      | xargs -r docker rm -f
  sudo apt-get purge -y nvidia-docker

  # Add NVIDIA's docker repository to your system.
  # Install nvidia-docker2 and restart the Docker daemon.
  curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
      && curl -s -L "https://nvidia.github.io/nvidia-docker/$(. /etc/os-release; echo $ID$VERSION_ID)/nvidia-docker.list" \
      | sudo tee /etc/apt/sources.list.d/nvidia-docker.list \
      && sudo apt-get update \
      && sudo apt-get install -y nvidia-docker2 \
      && sudo pkill -SIGKILL dockerd

  # Test nvidia-smi within the Docker container.
  sudo docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi

Verifying GPU+TenosrFlow operation::

  docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu-py3-jupyter \
    python3 -c "import tensorflow as tf; print(tf.test.is_gpu_available())"

Common Issues
~~~~~~~~~~~~~

In case of an error ``could not select device driver "" with capabilities: [[gpu]]``::

  sudo snap remove --purge docker
  sudo apt-get install docker.io nvidia-container-toolkit containerd
 
If you encounter the following error while attempting to install ``nvidia-docker2``::

    The following packages have unmet dependencies:
     nvidia-docker2 : Depends: nvidia-container-runtime (>= 3.2.0) but 3.1.4-1 is to be installed
    E: Unable to correct problems, you have held broken packages.

That package requires a specific version of ``nvidia-container-runtime`` which in turn requires a
specific version of ``nvidia-container-toolkit``. You can view available versions of any package like so::

  apt-cache madison nvidia-container-toolkit
  
To fix the issue, I force installation of a specific version of ``nvidia-container-toolkit``::

  sudo apt-get install nvidia-container-toolkit=1.1.0-1
  
And then repeat the ``nvidia-docker2`` installation command.

Basic Docker operation (for reference)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If the Docker daemon is not running, start it with::

  sudo service docker start

Pull the lastest Tensorflow image::

  docker pull tensorflow/tensorflow:latest-gpu-py3

To set up a custom repo for the image (effectively "forking" it)::

  docker tag <image-id> docker.io/<your-login-name>/<image-name>
  docker push docker.io/<your-ogin-name>/<image-name>

To see running images::

  docker ps -a

To commit and push changes::

  docker commit <container-id> <your-login-name>/<image-name>
  docker push <your-login-name>/<image-name>

To start Docker container as a non-root user, add ``-u $(id -u):$(id -g)``
to the command-line options. Conversely, to start as a root user (in
case the container does not start this way by default), use ``-u 0``. For
more information, see this `doc page`_.

To add current user to docker group::

  sudo gpasswd -a $USER docker

To login to your DockerHub account::

  sudo docker login
  
To run an image with a custom entrypoint (for example ``/bin/bash``)::

  docker run -it --entrypoint /bin/bash <your-login-name>/<image-name>

Cleaning up disk space
~~~~~~~~~~~~~~~~~~~~~~

To stop all containers::

  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

To prune images without containers created more than 24 hours ago::

  docker image prune -a --filter "until=24h"
 
To see which images take up disk space::

  docker system df -v

To remove all images::

  docker system prune -a -f

Installing Jupyter Lab
~~~~~~~~~~~~~~~~~~~~~~

To allow user-side installation of Jupyter and other packages, we need to set up
some directories under root (/). To do this, start the container as root (passing ``-u 0``)
and::

  mkdir /.local /.jupyter /.cache /.npm
  chown 1000:1000 /.local /.jupyter /.cache /.npm

You will need NodeJS and NPM for running plugins::

  apt-get install nodejs npm

Then save current changes (using ``docker commit`` and ``docker push``) and enter
docker image as regular user (passing ``-u $(id -u):$(id -g)``. The following commands should work::

  python3 -m pip install --user ipython ipywidgets nbstripout jupyter \
    jupyterlab jupyter_contrib_nbextensions

Finally run the following::

  jupyter contrib nbextensions install --user
  jupyter labextension install @jupyter-widgets/jupyterlab-manager
  jupyter labextension install @pyviz/jupyterlab_pyviz

Running Jupyter from Docker
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Start docker container from `project-dir`::

  cd project-dir
  sudo docker run -v $(pwd):/default -p 8888:8888 -u 0:1000 \
    --gpus all -it -e JUPYTER_ENABLE_LAB=yes \
    --rm escherba/tensorflow:latest-gpu-py3-jupyter /usr/local/bin/jupyter lab \
    --no-browser --ip 0.0.0.0 --allow-root --notebook-dir /default

Note: the recommended switch `-u $(id -u):$(id -g)` does not work for me because of various permission errors; I may figure this out later.

Now you can set up `port forwarding`_ to port 8888.

Troubleshooting
~~~~~~~~~~~~~~~

If `nvidia-docker` fails to work properly, some useful tips can be found in `[2]`_.

An old script for installing Docker on Ubuntu I found useful: `escherba/install.sh`_. Includes `docker-cleanup`_ command.

On error ``Got permission denied while trying to connect to the Docker daemon socket at...``, allow current user launch docker containers with::

  sudo setfacl -m user:$USER:rw /var/run/docker.sock

The user mapping ``-u $(id -u):$(id -g)`` is a useful shorthand for starting Docker containers in user mode, but sometimes it may be incorrect. Let's say your effective system user id is 1001, while inside docker container all files are created by user 1000. In such a case, use ``-u 1000:$(id -g)`` instead.

If you see the following error::

    Failed to fetch https://nvidia.github.io/nvidia-docker/ubuntu18.04/amd64/InRelease  
      The following signatures were invalid: EXPKEYSIG 6ED91CA3AC1160CD NVIDIA CORPORATION 
      (Open Source Projects) <cudatools@nvidia.com>
  
Run::

    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -

If `docker run` consistently fails while asking whether Docker daemon is running and `sudo service docker start` also fails, you can try the following::

    sudo su
    systemctl unmask docker.service
    systemctl unmask docker.socket
    systemctl start docker.service

If it still does not help, reboot machine.

If you get::

    The following packages have unmet dependencies:
    nvidia-docker2 : Depends: nvidia-container-runtime (>= 3.4.0) but 3.3.0-1 is to be installed
    E: Unable to correct problems, you have held broken packages

Edit the following file using vim or similar: ``/etc/apt/preferences.d/nvidia-docker-pin-1002``::

    Package: *
    Pin: origin nvidia.github.io
    Pin-Priority: 1002

Then run::

    sudo apt-get install -y nvidia-docker2


.. _[1]: https://lambdalabs.com/blog/set-up-a-tensorflow-gpu-docker-container-using-lambda-stack-dockerfile/
.. _[2]: https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html
.. _port forwarding: https://github.com/escherba/dotfiles/blob/master/notes/aws.rst#port-forwarding
.. _doc page: https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user
.. _escherba/install.sh: https://gist.github.com/escherba/1ffcf8ff9e0791f8206b737322f6e3bc
.. _docker-cleanup: https://gist.github.com/wdullaer/76b450a0c986e576e98b
