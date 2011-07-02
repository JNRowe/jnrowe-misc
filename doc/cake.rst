``Cake`` usage
==============

:pypi:`cake` is used for many of the repetitive and maintenance-related tasks in
this overlay.  It was chosen over :command:`make` as the :file:`Makefile` was
simply becoming too unwieldy, and as many of the support tools were already
written in Python_ ``cake`` seemed like a good choice.

``cupage`` support
------------------

``gen_cupage_conf``
'''''''''''''''''''

This task recreates the :file:`support/cupage.conf` file for this repository,
see :ref:`watch files`.

``cupage_check``
''''''''''''''''

This task checks a :file:`watch` file exists for every package in the
repository, see :ref:`watch files`.

.. _Python: http://python.org/
