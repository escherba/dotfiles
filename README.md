# dotfiles
A collection of config files for development on Mac OS X and Linux

## Mac OS X environment

### Development environment for Python

Install Xcode first from App Store. Following that, install the command-line development tools. In the terminal,

    xcode-select --install

Then Homebrew package manager:

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

To avoid the nagging "GitHub 401 Unauthorized" error that occasionally shows up when using brew, set up Github access token. Go to Github's [Personal Access Tokens](http://github.com/settings/tokens) page and create a new token named "HOMEBREW_GITHUB_API_TOKEN". Uncheck every scope box when creating this token. After receiving the token on the next page, copy it to system clipboard and have it being sourced into your environment on shell startup. Don't put it into your ``.bash_profile`` if you plan on sharing this file online, instead edit ``~/.private``, enter the ``export HOMEBREW_GITHUB_API_TOKEN=<token_text>`` line in there, and make sure to source the file from ``~/.bash_profile``.

To setup a development environment with GCC,

    brew install gcc
    brew install ctags-exuberant
    brew install enchant

Python-related packages:

    brew install python --framework
    brew install pyenv

Linting support for python:

    pip install pyenchant
    pip install pylint

### Vim

If you develop with Vim,

    brew install macvim --with-python --with-override-system-vim

Install NeoBunlde plug-in manager for Vim

    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

Then copy the included ``.vimrc`` into your home directory, open Vim and you should see NeoBunlde prompting you to install the missing plugins. The YouCompleteMe plugin requires special treatment:

    cd ~/.vim/bundle/YouCompleteMe
    bash install.sh --clang-completer
