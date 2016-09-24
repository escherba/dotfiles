A better git diff highlighter
-----------------------------

From http://stackoverflow.com/a/15149253 :

.. code-block:: bash

    cd ~/.local/bin
    curl -O https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight
    chmod +x diff-highlight
    git config --global pager.log 'diff-highlight | less'
    git config --global pager.show 'diff-highlight | less'
    git config --global pager.diff 'diff-highlight | less'
