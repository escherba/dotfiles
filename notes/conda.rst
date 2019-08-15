Anaconda and Jupyter Notes
==========================

Installation
------------

Download Conda distribution from
https://www.anaconda.com/distribution/ and run the interactive installer.

Basics
------

To create a Conda environment from a YAML file::

    conda env create -f environment.yml

To dump current environment into a YAML file::

    conda env export > environment.yml

To view all environments::

    conda env list

To switch between environments::

    conda activate <environment-name>
    conda deactivate

To remove an existing environment::

    conda env remove --name <environment-name>

To clean up an active conda environment::

    conda clean --all

Tensorflow v2 environment with Conda
------------------------------------

Create a new conda environment::

    conda deactivate
    conda create -n tf2b python=3.6 pip
    conda activate tf2b
    conda install setuptools
    conda install -c pytorch cuda100 cudatoolkit cudnn numba pytorch torchvision ignite
    conda install cython matplotlib seaborn pillow scikit-learn pandas jupyter jupyterlab \
        tqdm pywavelets pylint pyyaml statsmodels joblib pytest pydot ipykernel dill
    conda install -c conda-forge imbalanced-learn scikit-garden mlxtend xgboost
    conda install -c conda-forge tensorboard tensorboardx visdom lightgbm
    conda install -c conda-forge frozendict boto3 jupyter_contrib_nbextensions

Finally install Tensorflow 2.0-beta using pip::

    pip install tensorflow-gpu==2.0.0-beta1

Test whether GPU is available::

    python3
    >>> import tensorflow as tf
    >>> tf.test.is_gpu_available()

Some lesser-known packages can be installed through pip on top of Conda environment
(generally prefer Conda packages if they exist)::

    pip install gym

Possible issues: see `this page <https://github.com/tensorflow/tensorflow/issues/24828#issuecomment-457425190>`_

Tensorflow v1 environment with Conda
------------------------------------

Suppose we want an environment with an older version of Tensorflow::

    conda create -n tf1 python=3.6 pip
    conda activate tf1
    conda install numpy joblib pandas matplotlib jupyter jupyterlab scikit-learn \
        pylint seaborn scipy tensorflow-gpu

To test the Tensorflow environment::

    python3
    >>> import tensorflow as tf
    >>> tf.test.is_gpu_available()

The above should output `True`. If it outputs `False`, there are probably
missing CUDA libraries. Install them with::

    conda install cuda=10.0
    conda install cudnn=7.6


Jupyter
-------

::

    conda install ipywidgets
    conda install -c conda-forge nodejs jupyterthemes jupyter_contrib_nbextensions
    jupyter contrib nbextension install --user
    jupyter nbextension enable --py widgetsnbextension
    jupyter nbextension enable collapsible_headings/main
    jupyter nbextension enable notify/notify
    jupyter nbextension enable freeze/main
    jupyter nbextension emable hide_header/main
    jupyter nbextension enable spellchecker/main
    
    jupyter labextension install @jupyter-widgets/jupyterlab-manager

Other notes:
https://medium.com/@rrfd/jupyter-notebook-shortcuts-tips-and-tricks-top-nbextensions-bring-order-to-your-notebooks-pt-1-b58f270963f9

Creating Jupyter kernels from Conda environments
------------------------------------------------

::

    conda install ipykernel
    python3 -m ipykernel install --user --name tf2b --display-name "Python 3 (tf2b)"

Now you can select a kernel named `Python 3 (tf2b)` from the kernel dropdown
when creating a new Jupyter notebook.

To view installed kernels and to delete an existing one::

    jupyter kernelspec list
    jupyter kernelspec uninstall <kernel-name>
