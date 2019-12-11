Using Jupyter Lab with Docker on Nvidia GPU instances
=====================

Basic set up on GPU instances
------------

For setting up on Ubuntu, I found instructions in `Jonathan Petitcolas post`_ easy to follow.

To verify both that Nvidia-docker is working and that Tensorflow can recognize the GPU::

  docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu  \
    python -c "import tensorflow as tf; print(tf.test.is_gpu_available())"

This should print out "True."

Running Jupyter from Docker
------------

Assuming the project you're working on is under ``$HOME/project-dir`` and home is your current directory::

  docker run -v $(pwd):/default -p 8888:8888 --gpus all -it -e JUPYTER_ENABLE_LAB=yes \
    --rm <your-dockerhub-acct>/tensorflow:<tag> /usr/local/bin/jupyter lab \
    --no-browser --ip 0.0.0.0 --allow-root --notebook-dir /default/project-dir

Where intead of ``<your-dockerhub-acct>/tensorflow:<tag>`` I use something like ``escherba/tensorflow:mod``.

Now you can use `port forwarding`_

Basic Docker operation (for reference)
------------

Pull the lastest Tensorflow image::

  docker pull tensorflow/tensorflow:latest-gpu

To set up a custom repo for the image (effectively "forking" it)::

  docker push <your-dockerhub-acct>/tensorflow:<tag>
  
To see running images::

  docker ps -a

To commit and push changes::

  docker commit 8c5384b78fb5 <your-dockerhub-acct>/tensorflow:<tag>
  docker push <your-dockerhub-acct>/tensorflow:<tag>

To manage docker as a non-root user see this `doc page`_

.. _Jonathan Petitcolas post: https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html
.. _port forwarding: https://github.com/escherba/dotfiles/blob/master/notes/aws.rst#port-forwarding
.. _dock page: https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user
