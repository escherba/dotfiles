System stuff
------------

Power Management
~~~~~~~~~~~~~~~~

Some Intel CPUs have power save mode enabled. To allow full-speed operation, install `cpupower` utility. You can view available modes using ``cpupower idle-info``. To disable idle mode::

    cpupower idle-set -D 1
    
To reset default settings::

    cpupower idle-set -E

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

OpenCL and OpenMP
.................

To install OpenCL::

    sudo apt install ocl-icd-opencl-dev

To install OpenMP (for ``clang``)::

    sudo apt install libiomp-dev

MKL on Linux
.............

To install MKL system-wide, follow `mkl4deb`_ script. Then follow
`these instructions`_ to compile Numpy and Scipy to use it. Note: to
compile Scipy you may need::

    apt-get install gfortran

MKL on Mac OS X
...............

When using some Anaconda packages, you may encounter the error:
``Intel MKL FATAL ERROR: Cannot load libmkl_intel_thread.dylib``. This could happen if the
MKL library has not been added to library path. Adding the following to
``.bash_profile`` is likely to fix it::

    export LD_LIBRARY_PATH="/Users/<username>/anaconda3/lib:$LD_LIBRARY_PATH"

LightGBM with NVIDIA GPU support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Find out the version of NVIDIA driver you're running (this assumes 
you already have NVIDIA drivers along with ``nvidia-smi``):

nvidia-smi --query-gpu=driver_version --format=csv,noheader

Install OpenCL support. The version of ``nvidia-opencl-icd`` 
package should match the version of the NVIDIA driver on your system::

    sudo apt-get install -y --no-install-recommends \
        nvidia-opencl-icd-440 nvidia-opencl-dev opencl-headers

Install build tools::

    sudo apt-get install -y --no-install-recommends \
        cmake build-essential libboost-dev \
        libboost-all-dev libopenblas-dev
    
Install LightGBM dependencies into your environment (could be done with Conda)::

    python3 -m pip install scikit-learn joblib scipy numpy

Finally::

    python3 -m pip install lightgbm --install-option=--gpu
    
Sometimes you may want to specify additional options::

    python3 -m pip install lightgbm --install-option=--gpu \
        --install-option="--opencl-include-dir=/usr/local/cuda/include/" \
        --install-option="--opencl-library=/usr/local/cuda/lib64/libOpenCL.so"

To see other related installation instructions, visit `LightGBM PyPi page`_.

Memory usage monitoring on Ubuntu
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Install SysStat::

    sudo apt install sysstat
    sudo vi /etc/default/sysstat # change "false" to "true"
    sudo service sysstat restart

The following command will sample memory usage 5,000 times at 1-second intervals
and write results to ``memory_log.tsv``::

    sar -r 1 5000 > memory_log.tsv

You may want to view the file in a separate shell as it is being written with::

    tail -f memory_log.tsv

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

Opera Browser
~~~~~~~~~~~~~
To install Opera from command line::

    wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
    sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
    sudo apt-get update
    sudo apt install opera-stable pepperflashplugin-nonfree
    
Firewall on Ubuntu
~~~~~~~~~~~~~~~~~~

To enable firewall::

    sudo ufw enable

To allow SSH, connecting to ports 8000-9000 via TCP, and Samba file sharing::

    sudo ufw allow 22
    sudo ufw allow 8000:9000/tcp
    sudo ufw allow Samba

Notifications on Ubuntu
~~~~~~~~~~~~~~~~~~~~~~~

To see recent notifications in menu bar::

    sudo add-apt-repository ppa:jconti/recent-notifications
    sudo apt-get update
    sudo apt-get install indicator-notifications

If there is Spotify on the machine, this list may soon be full of Spotify notifications. To disable those::

    vi `find ~/.config/spotify/Users/ -name prefs`

and add::

    ui.track_notifications_enabled=false
