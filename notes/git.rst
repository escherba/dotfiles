A better git diff highlighter
-----------------------------

From http://stackoverflow.com/a/15149253 :

.. code-block:: bash

    git clone https://github.com/git
    cd git/contrib/diff-highlight
    make
    mkdir -p ~/.local/bin
    cp diff-highlight ~/.local/bin/

    git config --global pager.log 'diff-highlight | less'
    git config --global pager.show 'diff-highlight | less'
    git config --global pager.diff 'diff-highlight | less'
