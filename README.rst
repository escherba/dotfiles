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

Install Xcode first from App Store. Following that, install the
command-line development tools. In the terminal,

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

Scientific packages
~~~~~~~~~~~~~~~~~~~

HDF5 is needed for Pandas (and even if you don't use Pandas, you should
check out HDF5).

.. code-block:: bash

    brew install homebrew/science/hdf5
    brew install homebrew/science/opencv
    brew install homebrew/science/igraph

Haskell
~~~~~~~

Whether or not you program in Haskell, pandoc is a must-have.

.. code-block:: bash

    brew install ghc cabal-install
    cabal install pandoc

Python environment
~~~~~~~~~~~~~~~~~~

Basics:

.. code-block:: bash

    brew install python --framework
    brew install pyenv
    brew install homebrew/python/numpy
    brew install homebrew/python/scipy

Linting support for python:

.. code-block:: bash

    pip install pyenchant
    pip install pylint

Machine learning

.. code-block:: bash

    pip install pandas
    pip install scikit-learn

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
The YouCompleteMe plugin requires special treatment:

.. code-block:: bash

    cd ~/.vim/bundle/YouCompleteMe
    bash install.sh --clang-completer

Emacs
~~~~~

If you develop with Emacs, refer elsewhere.
