# dotfiles
A collection of config files for development on Mac OS X and Linux

## Additional software (Mac)

    brew install gcc
    brew install python --framework
    brew install macvim --with-python --with-override-system-vim
    brew install ctags-exuberant
    brew install enchant

## Vim plugins

To enable YouCompleteMe, after downloading the plugin with NeoBundle,

    cd ~/.vim/bundle/YouCompleteMe
    bash install.sh --clang-completer

## Linters for English, Python, etc

    pip install pyenchant
    pip install pylint
