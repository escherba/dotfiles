# dotfiles
A collection of config files for development on Mac OS X and Linux

## Development

Install Homebrew first:

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

To set up a basic development environment for Mac OS X with Vim:

    brew install gcc
    brew install python --framework
    brew install macvim --with-python --with-override-system-vim
    brew install ctags-exuberant
    brew install enchant

Install NeoBunlde plug-in manager for Vim

    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

Then copy the included ``.vimrc`` into your home directory, open Vim and you should see NeoBunlde prompting you to install the missing plugins. The YouCompleteMe plugin requires special treatment:

    cd ~/.vim/bundle/YouCompleteMe
    bash install.sh --clang-completer

You will also need:

    pip install pyenchant
    pip install pylint
