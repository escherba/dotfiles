PyCharm
-------

To disable spell checking in code: Go to `file | settings | editor | inspections | Spelling | Typo` and
remove checkmarks for `code` and `literals`.

https://intellij-support.jetbrains.com/hc/en-us/community/posts/207070915-disable-spell-checking-on-variable-declarations-

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

CSV differ
----------

The above utility (`diff-highlight`) generally handles CSV files quite well, but for a more specialized tool you try [daff](https://github.com/paulfitz/daff).
