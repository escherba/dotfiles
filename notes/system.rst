System stuff
------------

SSH
~~~

Setting up public key for remote access: https://archive.md/QgoS2

Troubleshooting
~~~~~~~~~~~~~~~

To restart Linux safely in case of a frozen desktop::

    Ctrl + Alt + PrtScn(SysRq) + reisub

where you hold <Ctrl>, <Alt> and <PrtScn(SysRq)> buttons, and while holding them down, press r, e, i, s, u, b with the remaining finger(s).

Libraries
~~~~~~~~~

To install OpenCL::

    sudo apt install ocl-icd-opencl-dev

To install OpenMP (for ``clang``)::

    sudo apt install libiomp-dev

MKL on Linux
~~~~~~~~~~~~

To install MKL system-wide, follow `mkl4deb`_ script. Then follow
`these instructions`_ to compile Numpy and Scipy to use it. Note: to
compile Scipy you may need::

    apt-get install gfortran

MKL on Mac OS X
~~~~~~~~~~~~~~~~

When using some Anaconda packages, you may encounter the error::

    Intel MKL FATAL ERROR: Cannot load libmkl_intel_thread.dylib

This could happen if the MKL library has not been added to library path. Adding the following to ``.bash_profile`` is likely to fix it::

    export LD_LIBRARY_PATH="/Users/<username>/anaconda3/lib:$LD_LIBRARY_PATH"

LightGBM
~~~~~~~~

LightGBM is best installed using Conda, but sometimes you may want to
use Pip, for example when building Docker images. To install it, first
install some dependencies::

    apt-get install cmake libboost-all-dev libopenblas-dev
    python3 -m pip install scikit-learn joblib scipy numpy

The following command builds LightGBM with GPU support::

    python3 -m pip install lightgbm --install-option=--gpu \
        --install-option="--opencl-include-dir=/usr/local/cuda/include/" \
        --install-option="--opencl-library=/usr/local/cuda/lib64/libOpenCL.so"

To see other related installation instructions, visit `LightGBM PyPi page`_.

NVIDIA drivers on Ubuntu
~~~~~~~~~~~~~~~~~~~~~~~~

If you want just the drivers::

    sudo -E add-apt-repository ppa:graphics-drivers/ppa
    sudo apt update
    ubuntu-drivers devices | grep nvidia

Now install the driver marked as "recommended", for example::

    sudo apt install nvidia-418

Then reboot to load the driver.


To install CUDA, download an appropriate .deb file from
https://developer.nvidia.com/cuda-toolkit. Then::

    sudo dpkg -i cuda-repo-ubuntu1604-10-1-local-10.1.168-418.67_1.0-1_amd64.deb
    sudo apt-key add /var/cuda-repo-10-1-local-10.1.168-418.67/7fa2af80.pub
    sudo apt-get update
    sudo apt-get install cuda

Then make sure you have the following in your `.bashrc` (and that
the appropriate symlinks exist)::

    export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}


.. _mkl4deb: https://github.com/eddelbuettel/mkl4deb/blob/master/script.sh
.. _these instructions: https://archive.md/vmch6
.. _LightGBM PyPi page: https://pypi.org/project/lightgbm/

