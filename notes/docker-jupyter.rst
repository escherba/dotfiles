Using Jupyter Lab with Docker on Nvidia GPU instances
-----------------------------------------------------

Basic set up on GPU instances
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For setting up on Ubuntu, I found instructions in `Jonathan Petitcolas post`_ easy to follow.

To verify both that Nvidia-docker is working and that Tensorflow can recognize the GPU::

  docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu-py3 \
    python3 -c "import tensorflow as tf; print(tf.test.is_gpu_available())"

This should print out "True."

Basic Docker operation (for reference)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pull the lastest Tensorflow image::

  docker pull tensorflow/tensorflow:latest-gpu-py3

To set up a custom repo for the image (effectively "forking" it)::

  docker tag <image-id> docker.io/<your-login-name>/<image-name>
  docker push docker.io/<your-ogin-name>/<image-name>

To see running images::

  docker ps -a

To commit and push changes::

  docker commit <image-id> <your-login-name>/<image-name>
  docker push <your-login-name>/<image-name>

To start Docker container as a non-root user, add ``-u $(id -u):$(id -g)``
to the command-line options. Conversely, to start as a root user (in
case the container does not start this way by default), use ``-u 0``. For
more information, see this `doc page`_.

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

  jupyter contrib nbextension install --user
  jupyter labextension install @jupyter-widgets/jupyterlab-manager
  jupyter labextension install @pyviz/jupyterlab_pyviz

Running Jupyter from Docker
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Assuming the project you're working on is under ``$HOME/project-dir`` and home is your current directory::

  docker run -v $(pwd):/default -p 8888:8888 --gpus all -it -e JUPYTER_ENABLE_LAB=yes \
    --rm <your-dockerhub-acct>/tensorflow:<tag> /usr/local/bin/jupyter lab \
    --no-browser --ip 0.0.0.0 --allow-root --notebook-dir /default/project-dir

Where intead of ``<your-dockerhub-acct>/tensorflow:<tag>`` I use something like ``escherba/tensorflow:mod``.

Now you can use `port forwarding`_

Troubleshooting
~~~~~~~~~~~~~~~

An old script for installing Docker on Ubuntu I found useful: `escherba/install.sh`_. Includes `docker-cleanup`_ command.

.. _Jonathan Petitcolas post: https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html
.. _port forwarding: https://github.com/escherba/dotfiles/blob/master/notes/aws.rst#port-forwarding
.. _doc page: https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user
.. _escherba/install.sh: https://gist.github.com/escherba/1ffcf8ff9e0791f8206b737322f6e3bc
.. _docker-cleanup: https://gist.github.com/wdullaer/76b450a0c986e576e98b
