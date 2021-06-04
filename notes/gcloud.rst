Gcloud stuff
==================

Configuring gsutil
------------------

Download google cloud tools from https://cloud.google.com/storage/docs/gsutil_install

Unzip and run ``./install.sh``. Then start a new shell and type::

    gsutil config -a

Enter Gcloud ID and secret key. Those can be copied from another machine you have configured (they should be in a file called ``application_default_credentials.json`` under ``~/.config/gcloud/``,
namely ``client_id` and ``client_secret``.

Then run::

    gcloud auth login

And point your browser at the URL, followed by copying the access code. Then::

    gcloud config set project <PROJECT_NAME>

To allow applications such as Pandas read/write access, follow up with::

    gcloud auth application-default login
