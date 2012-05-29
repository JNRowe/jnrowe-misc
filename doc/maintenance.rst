Maintenance tools
=================

:file:`Makefile.py` is used for many of the repetitive and maintenance-related
tasks in this overlay.  The custom code was chosen over :command:`make` as the
original :file:`Makefile` was simply becoming too unwieldy, and as many of the
support tools were already written in Python_ this trade felt like a good
choice.

Repository level support
------------------------

``all``
'''''''

This task performs all building tasks for the repository.  It is purely
a wrapper that executes any taks whose name begins with ``gen-``, and doesn't
need to be manually updated for new generators.

``check``
'''''''''

This task runs all the defined checks for the repository.  It is simply
a wrapper that executes any task whose name ends with ``-check``, and doesn't
need to be manually updated for new checks.

``clean``
'''''''''

This task removes generated files, such as HTML generated from reST sources.

``distclean``
'''''''''''''

In addition to the files removed by the clean_ target this task also removes
all the :file:`Manifest` files in the repository.

``eclass-doc-check``
''''''''''''''''''''

Check the syntax of eclass documentation using the ``awk`` script from
``app-portage/eclass-manpages``.

``task-doc-check``
''''''''''''''''''

Check all tasks are documented *here*.


``cupage`` support
------------------

``gen-cupage-conf``
'''''''''''''''''''

This task recreates the :file:`support/cupage.conf` file for this repository,
see :ref:`watch files`.

``cupage-check``
''''''''''''''''

This task checks that a :file:`watch` file exists for every package in the
repository, see :ref:`watch files`.

``layman`` support
------------------

``layman-check``
''''''''''''''''

This task performs a XML syntax check on the layman_ support files.

.. note::
   It is simply a check for "well formed-ness" as there is apparently no
   published schema to verify ``layman`` configuration files against.

Maintenance support tasks
-------------------------

``gen-stable``
''''''''''''''

This task creates a :file:`support/stabilisation.rem` snippet to use
a stabilisation reminder.  It requires a full ``<category>/<package>-<version>``
string as its only argument.  See the :ref:`stabilisation.rem` documentation.

``keyword-check``
'''''''''''''''''

This task is used to check whether packages have stable, or at least unstable,
keywords available on ``amd64`` and ``x86``.  These are the only supported archs
in this repository, and packages should be available on both where possible.

Previously ``arm`` was also supported, but this is no longer the case as the
packages that were most useful on ``arm`` have moved to another overlay.

``open-bug``
''''''''''''

This task will open a bug in the `GitHub repository's`_ issue tracker.  It
requires one argument, which will be used as the bug's title.  If you give a
second argument it will be used for the bug's body.  A third argument, if given,
will be used for the initial label for the bug.

The examples below should make the usage clear:

.. code-block:: sh

    ▶ ./Makefile.py open-bug 'new title'
    ▶ ./Makefile.py open-bug 'title' 'with extended body content'
    ▶ ./Makefile.py open-bug 'title' 'body' 'initial label'
    ▶ ./Makefile.py open-bug 'title' '' 'initial label'

It reads your GitHub authentication data using ``git config``, see the `setup
help page on GitHub`_ for more information.

.. note::
   This task fetches the repository identifier from the ``remote.origin.url``
   setting.  See :manpage:`git-config(1)`.

``bump-pkg``
''''''''''''

This task is a special case of the open-bug_ task whose sole purpose is to file
bump requests with the minimum of fuss.  It requires a full
``<category>/<package>-<version>`` string as its only argument.

It reads your GitHub authentication data using ``git config``, see the `setup
help page on GitHub`_ for more information.

.. note::
   This task fetches the repository identifier from the ``remote.origin.url``
   setting.  See :manpage:`git-config(1)`.

``portage`` support
-------------------

``gen-categories``
''''''''''''''''''

This task recreates the overlay's categories list in
:file:`profiles/categories`.

``gen-manifests``
'''''''''''''''''

This task will regenerate any missing, or stale, :file:`Manifest` files in the
repository.

.. note::

   If you have a :envvar:`PORTAGE_GPG_KEY` setting in :file:`/etc/make.conf` it
   will use that key to sign the created files.  See :manpage:`make.conf(5)` for
   more information on :file:`Manifest` signing.

``gen-news-sigs``
'''''''''''''''''

This task is used regenerate any missing, or stale, signatures for news
files.  See the `GLEP 42`_ documentation for more information.

This task requires you have :envvar:`PORTAGE_GPG_KEY` set in
:file:`/etc/make.conf` to function, see :manpage:`make.conf(5)` for details.

``gen-use-local-desc``
''''''''''''''''''''''

This task generates the :file:`profiles/use.local.desc` file using the ``USE``
flag information in each package's :file:`metadata.xml` definitions.  See
:manpage:`egencache(1)` and the `devmanual's metadata.xml`_ documentation for
more information.

``remind`` support
------------------

``gen-removals``
''''''''''''''''

This task is used to generate :file:`removals.rem`, see the :ref:`package.mask`
documentation for more information.

``reminders``
'''''''''''''

This task is just a shortcut for using remind_ to display the currently active
stabilisation and removal records.

.. _remind: http://www.roaringpenguin.com/products/remind

reStructuredText support
------------------------

``gen-html``
''''''''''''

This task generates HTML from all files ending in ``.rst``.  It uses the
equivalent of the :command:`rst2html.py` command's ``--strict`` flag, and will
fail if any errors or warnings are issued.


``gen-sphinx-html``
'''''''''''''''''''

This task rebuilds the documentation contained in :file:`doc/` using Sphinx_.

``gen-thanks``
''''''''''''''

This task is used to create :file:`doc/thanks.rst` from :file:`README.rst`, its
purpose is to remove the error-prone manual edits of both files when adding
contributor information.

``rst-check``
'''''''''''''

This task parses all files ending in ``.rst`` for conformity.  It uses the
equivalent of the :command:`rst2html.py` command's ``--strict`` flag, and will
fail if any errors or warnings are issued.

``tasks.utils``
---------------

This module is used to provide support functionality for use in other tasks. The
few developer facing functions are described below.

.. function:: command(func) -> func

   This decorator registers a function for command line access using argh_

.. function:: newer(file1, file2) -> Bool

   This function returns ``True`` if ``file1`` is newer than ``file2``.  It
   handles the case of file arguments that don't yet exist.

.. function:: dep(targets, sources[, mapping=False]) -> function

   ``dep`` is to be used for checking whether a target needs executing.  If the
   target is up to date the task is not run.

   If the ``mappings`` argument is ``True`` then rebuilds are only performed if
   a source is newer than a target when the arguments are paired.  If ``False``
   a rebuild is performed if *any* source is a newer than a target.

   :param list targets: Targets to check against
   :param list sources: Sources to check against
   :param bool mapping: Whether targets map directly to sources

.. function:: cmd_output(command)

   A simple wrapper for :func:`~subprocess.check_output` that call commands and
   returns the result with any whitespace padding removed

   :param str command: Command to execute

.. _Python: http://python.org/
.. _layman: http://layman.sourceforge.net
.. _setup help page on GitHub: http://help.github.com/set-your-user-name-email-and-github-token/
.. _GitHub repository's: https://github.com/JNRowe/jnrowe-misc/
.. _GLEP 42: http://www.gentoo.org/proj/en/glep/glep-0042.html
.. _devmanual's metadata.xml: http://devmanual.gentoo.org/ebuild-writing/misc-files/metadata/index.html
.. _Sphinx: http://sphinx.pocoo.org/
.. _argh: http://pypi.python.org/pypi/argh/
