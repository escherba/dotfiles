A better git diff highlighter
-----------------------------

From http://stackoverflow.com/a/15149253 :

.. code-block:: bash

    git clone https://github.com/git
    cd git/contrib/diff-highlight
    make
    sudo cp diff-highlight /usr/locao/bin/

    git config --global pager.log 'diff-highlight | less'
    git config --global pager.show 'diff-highlight | less'
    git config --global pager.diff 'diff-highlight | less'
