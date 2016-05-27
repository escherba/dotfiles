Jupyter on EMR
==============

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

After this is done, start Jupyter like so:

.. code-block:: bash

    jupyter notebook --no-browser --port 8001 --ip='*'

You will be able to select Toree Scala kernel from the drop down list in the browser.
