Anaconda and Jupyter Notes
==========================

Installation
------------

Download Conda distribution from
https://www.anaconda.com/distribution/ and run the interactive installer.

Basics
------

To create a blank Conda envirnoment called "py39" for Python 3.9::

    conda create -n py39 python=3.9 pip

To dump current environment into a Conda YAML config (this is Conda equivalent
of "pip freeze")::

    conda env export > environment.yml

Sometimes you want to look at which packages you actually told Conda to install
(i.e. you want ``env export`` output to ignore dependencies)::

    conda env export --from-history

To create a Conda environment from a Conda YAML config::

    conda env create -f environment.yml

To view all environments::

    conda env list

To switch to a different environment::

    conda activate <environment-name>

To delete an existing environment::

    conda deactivate
    conda env remove --name <environment-name>

To clean up an active conda environment (this reduces disk space usage)::

    conda clean --all

Using Conda with direnv
-----------------------

The program ``direnv`` allows automatically setting your environment depending
on the current working directory. This is extremely convenient for development.
You can install ``direnv`` on most systems, for example, on Ubuntu::

    sudo apt install direnv

After installing the program, add the following line to your Bash profile::

    [ -x "$(command -v direnv)" ] && eval "$(direnv hook bash)"

There is a ``.envrc`` file in provided in this directory that contains the
following lines::

    eval "$(conda shell.bash hook)"
    conda activate <env-name>
    export PYTHONPATH=$(python -c 'import site; print(":".join(site.getsitepackages()))')
    export LD_LIBRARY_PATH=$(which conda | sed 's/bin\/conda$/\/lib/'):$LD_LIBRARY_PATH

Where ``<env-name>`` is the name of their desired environment (you need
to set this yourself).

Note that this does not update the shell prompt which may show incorrect Conda
environment (the location of Python binary, for example, however, should be
correct, which is easy to verify using ``which python``). To avoid confusion,
you can disable Conda prompt globally using::

    conda config --set changeps1 False

Creating PyTorch environments with Conda
----------------------------------------

One benefit of Conda for ML is that it allows you to create isolated
environments with different versions of CUDA. For example here is how to
install PyTorch with GPU support (this works regardless of which version of
CUDA is installed system-wide)::

	conda create -n torch pytorch torchvision torchaudio cudatoolkit=10.2 \
		-c pytorch -c conda-forge -c nvidia

This creates an environment called "torch" with packages ``pytorch``,
``torchvision``, ``torchaudio``, and ``cudatoolkit=10.2`` that are pulled from
channels ``pytorch`` (official PyTorch channel), ``conda-forge``, and
``nvidia`` (official Nvidia channel).

The PyTorch website provides a handy tool for building out the conda command
that can be used to install PyTorch: https://pytorch.org/get-started/locally/

Creating Tensorflow environments with Conda
-------------------------------------------

To create a TF v2.4 environment on Linux::

    conda install -n base -c conda-forge mamba
    mamba create -c conda-forge -n tf24 pip python=3.8 pandas tqdm \
        scikit-learn matplotlib-base cloudpickle statsmodels \
        s3fs pyyaml pytest pytest-cov coverage colorlog bokeh colorcet pyarrow pydot \
        networkx jupyter jupyterlab ipython nodejs ipywidgets bottleneck numexpr ipdb \
        jupyter_contrib_nbextensions tensorflow-gpu=2.4 tensorflow-estimator=2.4 tensorboard=2.4 \
        numpy=1.19.2 gast=0.3.3 six=1.15.0 typing-extensions=3.7.4
    conda activate tf24
    jupyter contrib nbextension install --user
    jupyter labextension install @jupyter-widgets/jupyterlab-manager

To create a TF v2.5 environmnet on Linux::

    conda create -c conda-forge -n tf25 pip python=3.9 pydot numpy=1.19.5 \
        scikit-learn=0.24.2 pandas tqdm cloudpickle pyyaml matplotlib-base \
        bokeh networkx jupyter jupyterlab ipython nodejs ipywidgets bottleneck numexpr ipdb \
        jupyter_contrib_nbextensions pytest pytest-cov coverage colorlog \
        colorcet pyarrow statsmodels s3fs typing-extensions=3.7.4.3 six=1.15.0
    conda activate tf25
    pip install tensorflow_probability tensorflow-gpu==2.5
    jupyter contrib nbextension install --user
    jupyter labextension install @jupyter-widgets/jupyterlab-manager

To test whether GPU is available::

    python3
    >>> import tensorflow as tf
    >>> tf.test.is_gpu_available()

To create a Tensorflow v2.1 environment on a Mac::

    conda create -c anaconda --name tf21 pip numpy \
        pandas scipy=1.4.1 scikit-learn=0.23.2 matplotlib-base tqdm \
        cloudpickle s3fs pyyaml pytest pytest-cov coverage \
        colorlog bokeh colorcet pyarrow grpcio oauthlib pyasn1 pyasn1-modules \
        markdown werkzeug opt_einsum h5py=2.10.0 absl-py protobuf \
        astor astunparse cachetools gast=0.2.2 requests-oauthlib rsa termcolor
    conda activate tf21
    pip install tensorflow==2.1.0

Finally, to create a Tensorflow v2.5 envrionment on a Mac M1 machine::

    conda create -c apple -n tf-metal tensorflow-deps
    conda activate tf-metal
    conda install -c conda-forge pandas tqdm cloudpickle pyyaml matplotlib-base bokeh \
        scikit-learn s3fs pytest pytest-cov coverage colorlog colorcet pyarrow pydot \
        networkx jupyter jupyterlab ipython nodejs ipywidgets bottleneck numexpr ipdb \
        statsmodels
    python -m pip install tensorflow-macos
    python -m pip install tensorflow-metal
    python -m pip install jupyter_contrib_nbextensions
    jupyter contrib nbextension install --user
    jupyter labextension install @jupyter-widgets/jupyterlab-manager


Troubleshooting
~~~~~~~~~~~~~~~

If you get ``failed call to cuInit: CUDA_ERROR_UNKNOWN`` error when calling
``tf.test.is_gpu_available()``, the fix may be as simple as rebooting the
system.

If you get ``failed to get convolution algorithm``, see see
`this page <https://github.com/tensorflow/tensorflow/issues/24828#issuecomment-457425190>`_
for possible resolution.

Sometimes you may need to install Anaconda's CUDA packages directly. Do this like so::

    conda install cuda=10.0
    conda install cudnn=7.6
 
Creating Jupyter kernels from Conda environments
------------------------------------------------

::

    conda install ipykernel
    python3 -m ipykernel install --user --name tf2 --display-name "Python 3 (tf2)"

Now you can select a kernel named `Python 3 (tf2)` from the kernel dropdown
when creating a new Jupyter notebook.

To view installed kernels and to delete an existing one::

    jupyter kernelspec list
    jupyter kernelspec uninstall <kernel-name>

Jupyter (extensions)
-------------------------

::

    conda install ipywidgets
    conda install -c conda-forge nodejs jupyter_contrib_nbextensions
    jupyter contrib nbextension install --user
    
    jupyter nbextension enable --py widgetsnbextension
    jupyter nbextension enable collapsible_headings/main
    jupyter nbextension enable notify/notify
    jupyter nbextension enable freeze/main
    jupyter nbextension emable hide_header/main
    jupyter nbextension enable spellchecker/main
    
    jupyter labextension install @jupyter-widgets/jupyterlab-manager
    jupyter labextension install @pyviz/jupyterlab_pyviz
   
Other notes:
https://medium.com/@rrfd/jupyter-notebook-shortcuts-tips-and-tricks-top-nbextensions-bring-order-to-your-notebooks-pt-1-b58f270963f9
