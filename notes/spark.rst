Jupyter on EMR
==============

Installation
------------

First, install Jupyter on master node. Some installation here ensures that Jupyter can also start a Python kernels and isn't necessart for running Spark with Scala.

.. code-block:: bash

    sudo yum install gcc-gfortran
    sudo yum install python27-devel python27-pip. pyhton27-numpy python27-scipy
    sudo pip install py4j nose pandas jupyter

Append the following to the ``~/.bashrc``:

.. code-block:: bash

    export SPARK_HOME=/usr/lib/spark
    alias sudo='sudo env PATH=$PATH'

Install Apache Toree to support IBM Spark Kernel with Jupyter:

.. code-block:: bash

    sudo pip install --pre toree
    jupyter toree install --spark_home /usr/lib/spark --user

Running Jupyter
---------------

After installation is done, start Jupyter like so:

.. code-block:: bash

    nohup jupyter notebook --no-browser --port 8001 --ip='*'

You will be able to select Toree Scala kernel from the drop down list in the browser. The ``nohup`` prefix ensures that the process is run in a no-hangup mode, with output written to ``nohup.out``. If you lose shell control of the jupyter process, you should close all processes that are writing to ``nohup.out``:

.. code-block:: bash
    
    lsof | grep nohup.out | awk '{print $2}' | xargs kill
