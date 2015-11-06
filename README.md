# dotfiles
A collection of config files for development on Mac OS X and Linux

## Development

To set up a basic development environment for Mac OS X with Vim:

    brew install gcc
    brew install python --framework
    brew install macvim --with-python --with-override-system-vim
    brew install ctags-exuberant
    brew install enchant

To enable YouCompleteMe, after downloading the plugin with NeoBundle,

    cd ~/.vim/bundle/YouCompleteMe
    bash install.sh --clang-completer

You will also need:

    pip install pyenchant
    pip install pylint
