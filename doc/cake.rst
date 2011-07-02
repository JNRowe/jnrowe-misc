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

``org-mode`` support
--------------------

``gen_removals``
''''''''''''''''

This task is used to generate :file:`removals.org`, see the :ref:`package.mask`
documentation for more information.

``portage`` support
-------------------

``gen_categories``
''''''''''''''''''

This task recreates the overlay's categories list in :file:`profiles/categories`.

``gen_manifests``
'''''''''''''''''

This task will regenerate any missing, or stale, :file:`Manifest` files.

.. note::

   If you have a :envvar:`PORTAGE_GPG_KEY` setting in :file:`/etc/make.conf` it
   will use that key to sign the created files.  See :manpage:`make.conf(5)` for
   more information on :file:`Manifest` signing.

``gen_news_sigs``
'''''''''''''''''

This task is used regenerate any missing, or stale, signatures for news
files.  See the `GLEP 42`_ documentation for more information.

``gen_use_local_desc``
''''''''''''''''''''''

This task generates the :file:`profiles/user.local.desc` file using the ``USE``
flag information in each package's :file:`metadata.xml` definitions.  See
:manpage:`egencache(1)` and the `devmanual's metadata.xml`_ documentation for
more information.

reStructuredText support
------------------------

``gen_html``
''''''''''''

This task generates HTML from all files ending in ``.rst``.  It uses the
equivalent of the :command:`rst2html.py` command's ``--strict`` flag, and will
fail if any errors or warnings are issued.


``gen_sphinx_html``
'''''''''''''''''''

This task rebuilds the documentation contained in :file:`doc/` using Sphinx_.

``gen_thanks``
''''''''''''''

This task is used to create :file:`doc/thanks.rst` from :file:`README.rst`, its
purpose is to remove the necessity to manually edit both files when adding
contributor information.

``rst_check``
'''''''''''''

This task parses all files ending in ``.rst``.  It uses the equivalent of the
:command:`rst2html.py` command's ``--strict`` flag, and will fail if any errors
or warnings are issued.

``tasks.utils``
---------------

This module is used to provide support functionality for use in the
:command:`cake` tasks.  The developer facing functions are described below.


.. py:function:: newer(file1, file2) -> Bool

   This function returns ``True`` if ``file1`` is newer than ``file2``.  It
   handles the case of file arguments that don't yet exist.

.. py:function:: dep(targets, sources[, mapping]) -> function

   ``dep`` is designed to be used as a decorator on tasks for checking whether a
   target needs rebuilding.  If the target is up to date the task is not run.

   If the ``mappings`` argument is ``True`` then rebuilds are only performed if
   a source is newer than a target when the the arguments are paired.  If
   ``False`` a rebuild is performed if *any* source is a newer than a target.

   :param list targets: Targets to check against
   :param list sources: Sources to check against
   :param bool mapping: Whether targets map directly to sources

.. _Python: http://python.org/
.. _layman: http://layman.sourceforge.net
.. _setup help page on GitHub: http://help.github.com/set-your-user-name-email-and-github-token/
.. _GitHub repository's: https://github.com/JNRowe/misc-overlay/
.. _GLEP 42: http://www.gentoo.org/proj/en/glep/glep-0042.html
.. _devmanual's metadata.xml: http://devmanual.gentoo.org/ebuild-writing/misc-files/metadata/index.html
.. _Sphinx: http://sphinx.pocoo.org/
