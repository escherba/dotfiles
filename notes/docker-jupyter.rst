Using Jupyter Lab with Docker on Nvidia GPU instances
=====================

Basic set up on GPU instances
------------

Instructions on how to set up an Ubuntu instance to work with Nvidia Docker: 
https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html

To verify both that Nvidia-docker is working and that Tensorflow can recognize the GPU::

  docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu  \
    python -c "import tensorflow as tf; print(tf.test.is_gpu_available())"

This should print out "True."

Running Jupyter from Docker
------------

Example of how to start jupyter lab in a project folder called ``project-dir``::

  cd project-dir
  docker run -v $(pwd):/project-dir -p 8888:8888 --gpus all -it -e JUPYTER_ENABLE_LAB=yes \
    --rm escherba/tensorflow:mod /usr/local/bin/jupyter lab \
    --no-browser --ip 0.0.0.0 --allow-root --notebook-dir /project-dir

Basic Docker operation (for reference)
------------

Pull the lastest Tensorflow image::

  docker pull tensorflow/tensorflow:latest-gpu

To set up a custom repo for the image (effectively "forking" it)::

  docker push <your-dockerhub-handle>/tensorflow:<some-tag>
  
To see running images::

  docker ps -a

To commit and push changes::

  docker commit 8c5384b78fb5 escherba/tensorflow:mod
  docker push escherba/tensorflow:mod
