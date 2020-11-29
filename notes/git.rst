Git notes
=========

Adding a private key
----------------------

Refer to original instructions here: `_page 1`, `_page 2`. Run::

    $ ssh-keygen -t ed25519 -C "your_email@example.com"
    $ eval "$(ssh-agent -s)"
    $ vi ~/.ssh/config

And add the following lines::

	Host *
	  AddKeysToAgent yes
	  UseKeychain yes
	  IdentityFile ~/.ssh/id_ed25519

Then::

	$ ssh-add -k ~/.ssh/id_ed25519

Afterwards run::

	$ cat ~/.ssh/id_ed25519.pub

And copy the contents of the line. Then go to `_SSH keys` page in your GitHub profile,
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
 
 
.. _page 1: https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
.. _page 2: https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
.. _SSH keys: https://github.com/settings/keys
