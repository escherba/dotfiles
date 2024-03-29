Git notes
=========

Merging only a specific subdirectory from another branch
--------------------------------------------------------

Very simple:

.. code-block:: bash

    git checkout source_branch <paths>...

[Source](https://jasonrudolph.com/blog/2009/02/25/git-tip-how-to-merge-specific-files-from-another-branch/)

Adding a private key
----------------------

Refer to original instructions here: `page 1 <https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>`_, `page 2 <https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account>`_. Run::

    $ ssh-keygen -t ed25519 -C "your_email@example.com"
    $ eval "$(ssh-agent -s)"
    $ vi ~/.ssh/config

And add the following lines::

	Host *
	  AddKeysToAgent yes
	  IdentityFile ~/.ssh/id_ed25519

Then::

	$ chmod 600 ~/.ssh/config
	$ eval `ssh-agent -s`
	$ ssh-add -k ~/.ssh/id_ed25519

Afterwards run::

	$ cat ~/.ssh/id_ed25519.pub

And copy the contents of the line. Then go to `SSH keys <https://github.com/settings/keys>`_ page in your GitHub profile,
click "New SSH key" and paste the contents, labeling it with somehting like the name of the machine.

To ensure that git stores your credentials and does not prompt you for password every time::

	$ git config --global credential.helper store
	$ git config --global credential.helper cache


A better git diff highlighter
-----------------------------

From http://stackoverflow.com/a/15149253 :

.. code-block:: bash

    git clone https://github.com/git/git
    cd git/contrib/diff-highlight
    make
    sudo cp diff-highlight /usr/local/bin/

    git config --global pager.log 'diff-highlight | less'
    git config --global pager.show 'diff-highlight | less'
    git config --global pager.diff 'diff-highlight | less'


Troubleshooting
-------------------

If git commands are not colorized, you may need to run::

    git config --global color.ui auto
 
