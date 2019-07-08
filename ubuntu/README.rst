dotfiles
========

A collection of config files for development on Mac OS X and Linux

Quick Linux Setup for AWS
-------------------------

On Amazon AMI instances:

.. code-block:: bash

    # update
    sudo yum -y update
    sudo yum -y upgrade

On Ubuntu instances:

.. code-block:: bash

    # update
    sudo apt update
    sudo apt upgrade

and then

.. code-block:: bash

    # enable EPEL6 by changing enabled=0 -> enabled=1
    sudo vim /etc/yum.repos.d/epel.repo

    # install misc. utilities
    sudo yum install htop tmux mosh

    # configure Tmux
    curl https://raw.githubusercontent.com/escherba/dotfiles/master/home/.tmux-linux.conf -o ~/.tmux.conf


Linux environment (Ubuntu)
--------------------------

First set up basic development environment::

    sudo apt update
    sudo apt upgrade
    sudo apt dist-upgrade
    reboot

    sudo apt install gcc make dkms build-essential linux-headers-$(uname -r)
    sudo apt install xorg-dev xserver-xorg-dev freeglut3-dev
    sudo dpkg-reconfigure xserver-xorg


NVIDIA stuff
------------

If you want just the drivers::

    sudo -E add-apt-repository ppa:graphics-drivers/ppa
    sudo apt update
    ubuntu-drivers devices | grep nvidia

Now install the driver marked as "recommended", for example::

    sudo apt install nvidia-418

Then reboot to load the driver.


To install CUDA, download an appropriate .deb file from
https://developer.nvidia.com/cuda-toolkit. Then:

    sudo dpkg -i cuda-repo-ubuntu1604-10-1-local-10.1.168-418.67_1.0-1_amd64.deb
    sudo apt-key add /var/cuda-repo-10-1-local-10.1.168-418.67/7fa2af80.pub
    sudo apt-get update
    sudo apt-get install cuda

Then make sure you have the following in your `.bashrc` (and that
the appropriate symlinks exist)::

    export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

Tensorflow v1 environment with Conda
------------------------------------

This is probably preferred to virtualenv. Download Conda distribution for Linux
from https://www.anaconda.com/distribution/ Run the interactive installer.

When done, test if Conda can set up Tensorflow with all the appropritate
dependencies::

    conda create -n tf1
    conda activate tf1
    conda install -c pytorch cuda100 cudatoolkit cudnn numba pytorch torchvision ignite
    conda install tensorflow-gpu

For some strange reason, `conda install tensorflow-gpu` is not sufficient to get TensorFlow
to recognize the GPU (TODO: why?) and needs to be followed up by::

    pip install tensorflow-gpu

To test the Tensorflow environment::

    python3
    >>> import tensorflow as tf
    >>> tf.test.is_gpu_available()

The above should output `True`. Alternatively, for PyTorch::

    python3
    >>> import torch
    >>> torch.cuda.is_available()

The following may also be useful::

    conda install jupyter matplotlib seaborn pillow scikit-learn pandas pydot tqdm pywavelets pyyaml

For some additional packages, there is `conda-forge`::

    conda install -c conda-forge imbalanced-learn scikit-garden mlxtend xgboost
    conda install -c conda-forge tensorboard tensorboardx visdom lightgbm
    conda install -c conda-forge jupyter_contrib_nbextensions

To actually enable jupyter extensions, run::

    jupyter contrib nbextension install --user
    jupyter nbextension enable collapsible_headings/main
    jupyter nbextension enable notify/notify
    jupyter nbextension enable freeze/main
    jupyter nbextension emable hide_header/main

More Jupyter set up::

    conda install -c conda-forge nodejs
    jupyter labextension install @jupyter-widgets/jupyterlab-manager
    conda install -c conda-forge jupyterthemes


Tensorflow v2 environment with Conda
------------------------------------

Suppose we want a slightly different version of Conda environment with a later version of CUDA
and Tensorflow 2.0-beta (which at the moment of this writing is not yet installed by default).

Create a new conda environment::

    conda deactivate
    conda create -n tf2b python=3.6 pip
    conda activate tf2b
    conda install -c pytorch cuda100 cudatoolkit cudnn numba pytorch torchvision ignite
    conda install matplotlib seaborn pillow scikit-learn pandas jupyter tqdm pywavelets \
        pyyaml statsmodels joblib pytest pydot ipykernel dill
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

Creating Jupyter kernels from Conda environments
------------------------------------------------

::

    conda install ipykernel
    python3 -m ipykernel install --user --name tf2b --display-name "Python 3 (tf2b)"

Now you can select a kernel named `Python 3 (tf2b)` from the kernel dropdown when
creating a new Jupyter notebook.


The Rest of the Installation
----------------------------

Install GUI with::

    sudo apt install ubuntu-desktop
    sudo apt install software-center unity-tweak-tool indicator-multiload synaptic terminator

(Optional) Disable the default graphics drivers. The following SO answer gives
detailed instructions on how to disable the default driver:
http://askubuntu.com/a/508255 .

Before installing Vim, it might be a good idea to remove existing
installation(s) of this editor. Run ``dpkg --get-selections | grep vim`` and
uninstall any packages present. Then::

    sudo apt install vim-gtk

To select the specific verison of Vim as default::

    sudo update-alternatives --config vi

Finally install some useful packages::

   sudo apt install htop tmux mosh
   sudo apt install git clang cmake exuberant-ctags
   sudo apt install graphviz graphviz-dev r-base
   sudo apt install msttcorefonts
   sudo apt install silversearcher-ag
   sudo apt install python-pip python-virtualenv cython
   sudo apt install python-scipy python-pandas python-igraph \
       python-opencv python-matplotlib python-sklearn

To support OpenMP compilation with clang::

    sudo apt install libiomp-dev

If you installed Ubuntu Server, you may have services running (such as Apache2
and MySQL) that you don't actually want. Ensure their startup on boot is manual
by::

    echo manual | sudo tee /etc/init/apache2.override
    echo manual | sudo tee /etc/init/mysql.override

For bookkeeping, to generate a list of user-installed packages, use::

    comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

If you edit `~/.Xdefaults`, source the changes with::

    xrdb -merge ~/.Xdefaults

Docker is best installed with the help of this script: https://gist.github.com/escherba/1ffcf8ff9e0791f8206b737322f6e3bc

Installing a recent version of R
--------------------------------

Add the following entry to file `/etc/apt/sources.list`::

    deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/

Run command::

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

Finally::

    sudo apt update
    sudo apt install r-base r-base-dev

If you updated R from the previous version, installed packages will become incompatible.
To update them::

    update.packages(ask=FALSE, checkBuilt = TRUE)

For more info, see: https://cran.r-project.org/bin/linux/ubuntu/

Misc
-----

OpenCL library::

    sudo apt install ocl-icd-opencl-dev

Haskell
~~~~~~~

Whether or not you program in Haskell, pandoc is a must-have.

.. code-block:: bash

    #brew install ghc cabal-install
    cabal install pandoc
    cabal install hoogle
    cabal install ghc-mod
    cabal install hdevtools
    cabal install hlint
    cabal install pointfree
