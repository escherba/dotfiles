
Zeppelin on EMR
===============

These instructions are after: https://mail-archives.apache.org/mod_mbox/incubator-zeppelin-users/201511.mbox/%3CCAF9mLAD1=GW_ghO==Vt1zUCYSoHRrkvaj0N-eyJzt-QEyPBb=A@mail.gmail.com%3E

To have default EMR instance with Zeppelin store notebooks in S3, create the following bucket: ``/<my-bucket-name>/zeppelin/notebook/``

.. code-block:: bash

   sudo vim /etc/zeppelin/conf.dist/zeppelin-env.sh

and add:

.. code-block:: bash

    export ZEPPELIN_NOTEBOOK_S3_BUCKET=<my-bucket-name>
    export ZEPPELIN_NOTEBOOK_S3_USER=zeppelin

Create and edit ``zeppelin-site.xml``:

.. code-block:: bash

    sudo cp /etc/zeppelin/conf.dist/zeppelin-site.xml.template /etc/zeppelin/conf.dist/zeppelin-site.xml
    sudo vim /etc/zeppelin/conf.dist/zeppelin-site.xml

uncomment the following:

.. code-block:: xml

   <property>
      <name>zeppelin.notebook.s3.user</name>
      <value>zeppelin</value>
      <description>user name for s3 folder structure</description>
   </property>

   <property>
      <name>zeppelin.notebook.s3.bucket</name>
      <value>my-bucket-name</value>
      <description>bucket name for notebook storage</description>
   </property>

   <property>
      <name>zeppelin.notebook.storage</name>
      <value>org.apache.zeppelin.notebook.repo.S3NotebookRepo</value>
      <description>notebook persistence layer implementation</description>
   </property>

comment the following:

.. code-block:: xml

    <!--
    <property>
        <name>zeppelin.notebook.storage</name>
        <value>org.apache.zeppelin.notebook.repo.VFSNotebookRepo</value>
        <description>notebook persistence layer implementation</description>
    </property>
    -->

(optionally) remember to put any of your notebooks into the S3 bucket. Some example notebooks
are found at: https://github.com/Leemoonsoo?tab=repositories

Finally, restart zeppelin

.. code-block:: bash

    sudo /usr/lib/zeppelin/bin/zeppelin-daemon.sh stop
    sudo /usr/lib/zeppelin/bin/zeppelin-daemon.sh start
