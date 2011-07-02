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

``layman`` support
------------------

``layman_check``
''''''''''''''''

This task performs a XML syntax check on the layman_ support files.

.. note::
   It is simply a check for "well formed-ness" as there is apparently no
   published schema to verify ``layman`` configs against.

Maintenance support tasks
-------------------------

``gen_stable``
''''''''''''''

This task creates a :file:`support/stabilisation.org` snippet.  It requires a
full ``<category>/<package>-<version>`` string as its only argument.  See
the :ref:`stabilisation.org` documentation.

``keyword_check``
'''''''''''''''''

This task is used to check whether packages have stable, or at least unstable,
keywords available on ``amd64`` and ``x86``.  These are the only supported archs
in this repository, and packages should be available on both where possible.

Previously ``arm`` was also supported, but this is no longer the case as the
packages that were most useful on ``arm`` have moved to another overlay.

``open_bug``
''''''''''''

This task will open a bug in the `GitHub repository's`_ issue tracker.  It
requires one argument, which will be used as the bug's title.  If you give a
second argument it will be used for the bug's body.  A third argument, if given,
will be used for the initial label for the bug.

The examples below should make the usage quite clear::

    ▶ cake open_bug 'new title'
    ▶ cake open_bug 'title' 'with extended body content'
    ▶ cake open_bug 'title' 'body' 'initial label'
    ▶ cake open_bug 'title' '' 'initial label'

It reads your GitHub authentication data using ``git config``, see the `setup
help page on GitHub` for more information.

.. note::
   This task fetches the repository identifier from the ``remote.origin.url``
   setting.  See :manpage:`git-config(1)`.

``bump_pkg``
''''''''''''

This task is a special case of the ``open_bug`` task above whose sole
purpose is to file bump requests with the minimum of fuss.  It requires a full
``<category>/<package>-<version>`` string as its only argument.

It reads your GitHub authentication data using ``git config``, see the `setup
help page on GitHub` for more information.

.. note::
   This task fetches the repository identifier from the ``remote.origin.url``
   setting.  See :manpage:`git-config(1)`.

.. _Python: http://python.org/
.. _layman: http://layman.sourceforge.net
.. _setup help page on GitHub: http://help.github.com/set-your-user-name-email-and-github-token/
.. _GitHub repository's: https://github.com/JNRowe/misc-overlay/
