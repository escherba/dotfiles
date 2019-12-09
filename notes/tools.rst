PyCharm
-------

Spell checking
~~~~~~~~~~~~~~

To `disable spell checking`_ in code, go to "File -> Settings -> Editor -> Inspections -> Spelling -> Typo" and
remove "code" and "literals" checkmarks.

Inotify Watches Limit
~~~~~~~~~~~~~~~~~~~~~

To increase `inotify watches limit`_, modify ``/etc/sysctl.conf`` to include::

    fs.inotify.max_user_watches = 524288

Then apply the change with::

    sudo sysctl -p --system

Vim
---

Neovim may be better at this point, but for traditional Vim you want one that is built with Python 3.
First remove existing installations (find out which ones you have by running ``dpkg --get-selections | grep vim``).
Then::

    sudo apt install vim-gtk

To select a specific version as default::

    sudo update-alternatives --config vi


A better git diff highlighter
-----------------------------

From http://stackoverflow.com/a/15149253 :

.. code-block:: bash

    git clone https://github.com/git/git
    cd git/contrib/diff-highlight
    make
    sudo cp diff-highlight /usr/locao/bin/

    git config --global pager.log 'diff-highlight | less'
    git config --global pager.show 'diff-highlight | less'
    git config --global pager.diff 'diff-highlight | less'

CSV diff tool
-------------

The above utility (``diff-highlight``) generally handles CSV files quite
well, but for a more specialized tool try `daff`_.

.. _daff: https://github.com/paulfitz/daff
.. _inotify watches limit: https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
.. _disable spell checking: https://intellij-support.jetbrains.com/hc/en-us/community/posts/207070915-disable-spell-checking-on-variable-declarations-

Miscellaneous
-------------

Libraries
~~~~~~~~~

To install OpenCL::

    sudo apt install ocl-icd-opencl-dev

To install OpenMP (for ``clang``)::

    sudo apt install libiomp-dev

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
