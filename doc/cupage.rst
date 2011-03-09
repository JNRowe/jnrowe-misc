``cupage`` integration
======================

cupage_ is used to keep packages in sync with their releases.  ``cupage``
v0.5.4, or above, is required if you wish to make use of this functionality.

All packages in this repository must have an entry in ``cupage`` configuration
file :file:`support/cupage.conf`, and those entries are generated from the
:file:`watch` files in package directories.

:file:`watch` file format
-------------------------

For packages hosted on one of the hosting sites supported by ``cupage`` a
:file:`watch` file can be very simple [#]_.  For example, the :file:`watch` file
for ``dev-python/argh`` contains only one line:

.. code-block:: ini

    site = pypi

The above definition tells ``cupage`` to check for updates to the package named
``argh`` on PyPI_.

For packages where the name differs between upstream and this repository for
some reason you must specify the name in the :file:`watch` file.  From
``dev-python/pyscss``:

.. code-block:: ini

    [pyScss]
    site = pypi

If the package you are adding is not in the list of supported sites then you'll
need to manually define the :file:`watch` information.
``app-misc/weatherspect`` provides a useful example:

.. code-block:: ini

    url = http://www.robobunny.com/projects/weatherspect/
    select = td a
    match_type = re
    match = weatherspect_v[\d\.]+\.tar\.gz

This tells ``cupage`` to search the defined URL for ``a`` elements that are
children of ``td`` in the HTML, and to match their ``href`` attributes against
the ``match`` regular expression.

A more thorough explanation of the format and available options can be found in
the `cupage documentation`_.

.. [#] Use :command:`cupage.py --list-sites` to see the list supported sites
       in your version of ``cupage``

.. _cupage: http://jnrowe.github.com/cupage/
.. _PyPI: http://pypi.python.org/
.. _cupage documentation: http://jnrowe.github.com/cupage/configuration.html
