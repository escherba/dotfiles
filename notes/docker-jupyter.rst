Instructions on how to set up an Ubuntu instance to work with Nvidia Docker: 
https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html

To verify both that Nvidia-docker is working and that Tensorflow can recognize the GPU::

  docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu  \
    python -c "import tensorflow as tf; print(tf.test.is_gpu_available())"

  docker run -v $(pwd):/houdini -p 8888:8888 --gpus all -it -e JUPYTER_ENABLE_LAB=yes \
    --rm escherba/tensorflow:mod /usr/local/bin/jupyter lab \
    --no-browser --ip 0.0.0.0 --allow-root --notebook-dir /houdini
