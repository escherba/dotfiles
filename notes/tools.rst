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

Python
------

Install the following into system Python::

    sudo /usr/local/bin/pip3 install yapf
    sudo /usr/local/bin/pip3 install flake8
    sudo /usr/local/bin/pip3 install pylint
    sudo /usr/local/bin/pip3 install autopep8
    sudo /usr/local/bin/pip3 install pylama
    sudo /usr/local/bin/pip3 install pynvim

Vim
---

Neovim may be better at this point, but for traditional Vim you want one that is built with Python 3.
First remove existing installations (find out which ones you have by running ``dpkg --get-selections | grep vim``).
Then::

    sudo apt install vim-gtk

To select a specific version as default::

    sudo update-alternatives --config vi

To install space-vim::

    bash <(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)

Also copy settings::
    
    curl https://raw.githubusercontent.com/escherba/dotfiles/master/home/.spacevim -o ~/.spacevim
    curl https://raw.githubusercontent.com/escherba/dotfiles/master/home/.config/flake8 -o ~/.config/flake8
    
To instal NeoVim on Ubuntu versions previous to 18::

    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt update
    sudo apt install neovim

To find out where a Vim default such as ``hlsearch`` was last set, enter::

    :verb set hlssearch?
 
CSV diff tool
-------------

The above utility (``diff-highlight``) generally handles CSV files quite
well, but for a more specialized tool try `daff`_.

.. _daff: https://github.com/paulfitz/daff
.. _inotify watches limit: https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
.. _disable spell checking: https://intellij-support.jetbrains.com/hc/en-us/community/posts/207070915-disable-spell-checking-on-variable-declarations-

Converting a group of JSON files to CSV
---------------------------------------

Suppose you have a list of JSON files ``stats-1.json``, ``stats-2.json``, etc., each encoding a JSON dict. You want to convert their output into a DataFrame format saved in a CSV. To do that, install ``json2csv`` using NPM::

    npm install -g json2csv

and then::

    cat stats*.json | jq -c | json2csv > out-stats.csv
