To raise an error every time a warning in a particular category 
(for example ``FutureWarning``) is set, add the following lines to the very 
beginning of yourse script::

  import warnings
  warnings.filterwarnings("error", category=FutureWarning)
