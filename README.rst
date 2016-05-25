dotfiles
========

A collection of config files for development on Mac OS X and Linux

Mac OS X environment
--------------------

It turns out it is quite involved to make a Mac OS X system usable as a
development machine. But never fear, it can be as fast as a few hours =)
if you follow the instructions below.

Basics
~~~~~~

First, install Xcode from the App Store. Then, install the
command-line development tools as follows: in the terminal,

::

    xcode-select --install

Then Homebrew package manager:

.. code-block:: bash

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

To avoid the nagging "GitHub 401 Unauthorized" error that occasionally
shows up when using brew, set up Github access token. Go to Github's
`Personal Access Tokens <http://github.com/settings/tokens>`__ page and
create a new token named ``HOMEBREW_GITHUB_API_TOKEN``. Uncheck every
scope box when creating this token. After receiving the token on the
next page, copy it to system clipboard and have it sourced into your
environment on shell startup. Don't place it into your ``.bash_profile``
if you plan on sharing this file online, instead edit ``~/.profile``,
enter the ``export HOMEBREW_GITHUB_API_TOKEN=<token_text>`` line in
there, and make sure to source the file from ``~/.bash_profile``.

To setup a development environment with GCC,

.. code-block:: bash

    brew install gcc
    brew install coreutils
    brew install gnu-sed
    brew install ctags-exuberant
    brew install enchant
    brew install pstree
    brew install wget
    brew install cmake
    brew install valgrind
    brew install tmux
    brew install graphviz
    brew install Caskroom/cask/xquartz

Other dependencies:

.. code-block:: bash

    brew install git gpg
    brew install czmq zmq

Java
~~~~

Download and install an SDK from `Oracle site <http://www.oracle.com/technetwork/java/javase/downloads/index.html>`_. Some exotic packages (Octave) require Java 6 which can be had from `Apple site <https://support.apple.com/kb/DL1572>`_. Install latest Eclipse. Follow instructions from `Getting Started <http://scala-ide.org/docs/user/gettingstarted.html>`_ page for Scala IDE to configure Eclipse to work with Scala projects. Install `eclim` following the instructions on `this page <http://eclim.org/install.html>`_. Then,


.. code-block:: bash

    brew install sbt maven gradle
    brew install scala
    brew install apache-spark


Scientific packages
~~~~~~~~~~~~~~~~~~~

HDF5 is needed for Pandas (and even if you don't use Pandas, you should
check out HDF5).

.. code-block:: bash

    brew install python --framework
    brew install pyenv
    brew install pyenv-virtualenv
    brew install homebrew/science/hdf5
    brew install homebrew/science/octave
    brew install homebrew/science/r
    brew install homebrew/science/opencv

    brew install homebrew/python/numpy
    brew install homebrew/python/scipy

    brew install homebrew/science/igraph
    brew install homebrew/science/graph-tool

Haskell
~~~~~~~

Whether or not you program in Haskell, pandoc is a must-have.

.. code-block:: bash

    brew install ghc cabal-install
    cabal install pandoc
    cabal install hoogle
    cabal install ghc-mod
    cabal install hdevtools
    cabal install hlint
    cabal install pointfree

Python environment
~~~~~~~~~~~~~~~~~~

Linting support for python:

.. code-block:: bash

    pip install -U pip
    pip install pyenchant
    pip install pylint
    pip install flake8

Machine learning

.. code-block:: bash

    pip install pandas
    pip install scikit-learn
    pip install jupyter


Git
~~~

Jupyter/IPython notebooks require a filter to work well with version control. After `this post <http://stackoverflow.com/a/20844506/597371>`_, here are instructions how to set up the filter:

1. Make sure `nbformat` is installed:

.. code-block:: bash

    pip install nbformat

2. Run these commands:

.. code-block:: bash

    git config --global core.attributesfile ~/.gitattributes
    git config --global filter.dropoutput_ipynb.clean ~/bin/ipynb_output_filter.py
    git config --global filter.dropoutput_ipynb.smudge cat

Vim
~~~

If you develop with Vim,

.. code-block:: bash

    brew install macvim --with-python --with-override-system-vim

Install NeoBunlde plug-in manager for Vim

.. code-block:: bash

    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

Then copy the included ``.vimrc`` into your home directory, open Vim and
you should see NeoBunlde prompting you to install the missing plugins.
The YouCompleteMe plugin should be set up automatically via a post-install hook,
but if it isn't,

.. code-block:: bash

    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    python install.py --clang-completer

For more information on YouCompleteMe installation specifics, see `this README section <https://github.com/Valloric/YouCompleteMe#mac-os-x>`__.

Emacs
~~~~~

If you develop with Emacs, well, too bad :(
