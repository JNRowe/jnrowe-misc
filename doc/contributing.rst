Contributing
============

A few notes, beyond the advice in the excellent devmanual_, that should be taken
in to consideration when contributing to this overlay.

:command:`die` usage
--------------------

There are few differences between how :command:`die` is commonly used in the
upstream tree, and how it is used in this overlay.  The rules in the overlay
aren't always strictly enforced, but documenting this will hopefully reduce the
number of usage questions I'm asked.

:command:`sed` and :command:`die`
'''''''''''''''''''''''''''''''''

:command:`sed` should not be followed by a :command:`die` in any ``ebuild`` in
this overlay.  Invariably, it leads to a misunderstanding of what is actually
happening and continuing the usage is quite counter-productive.

The only thing the ``sed || die`` construct achieves is a failure if a specified
file is missing.  Too many people seem to believe it does other things, such as
fail if an expression can't be applied.  [And frankly, if your :command:`die`
calls are triggered because of missing or mispelt files there are much greater
problems than a poorly defined call to :command:`sed`.]

.. note::

   Users inside the AST firewall should note that our :command:`sed` wrappers
   used within an ``ebuild`` will call ``die`` internally if a file doesn't
   exist or an expression doesn't apply.

:command:`do*` and :command:`die`
'''''''''''''''''''''''''''''''''

It is common practise within the main Gentoo repository that calls to the likes
of :command:`dodoc` or :command:`doman` do not call :command:`die` on failure.
This is *not* acceptable in this overlay.

Usage of wildcards in calls to :command:`do*` is also frowned upon, but not
enough to clean up previous usage [yet].

All entities that should be installed should raise a failure if they are not
installed, there is no middle ground for some specific types of files.

:envvar:`RESTRICT` usage
------------------------

All usage of :envvar:`RESTRICT` in an ``ebuild`` should be accompanied by an
explanation of the reason for the restriction.  It should be obvious to someone
looking at an ``ebuild`` the reason why tests, for example, are blocked for a
given package.

Of course, it is preferable to fix the underlying reason for needing a
:envvar:`RESTRICT` definition, especially in the case of ``test`` and
``userpriv`` restrictions.

:file:`stabilisation.org`
-------------------------

:file:`support/stabilisation.org` is an org-mode_ compatible data file that
contains *likely* stabilisation dates for packages.  When a new arch keyword is
added or a package receives a version bump this file is updated to reflect the
earliest possible time a package can migrate to stable.

The format is simple enough::

    * |CPV|  |arch| SCHEDULED: <|stable_date|>

.. note::

   The initial ``stable date`` value is 30 days in the future, although it can
   be longer if more testing is likely to be necessary.

:file:`package.mask`
--------------------

The :file:`profiles/package.mask` file includes special syntax for generating
removal reminders for packages.  An example should explain it adequately::

    # James Rowe <jnrowe@gmail.com> (27 Jan 2011)
    # Better alternatives available including busybox's fbsplash, plymouth, ksplash
    # and many others.
    # X-Removal: 2011-02-26
    media-gfx/psplash

The format is identical to that defined in :manpage:`portage(5)` with the
addition of the ``X-Removal`` tag that is used by the
:program:`support/gen_removal.py` script to create an org-mode_ compatible data
file.

A simple, but important, extension that makes it easier to keep on top of
important admin tasks.

:file:`distutils.eclass` usage
------------------------------

When using ``RESTRICTED_PYTHON_ABIS`` functionality from
:file:`distutils.eclass` it is important to state the reason why a certain
Python version is restricted.

This should, in theory, make it easier to track updates and also make it
immediately clear how much work is required to support a specific version if the
need arises.

A simple example from the ``ebuild`` for rad_ would be:

.. code-block:: bash

    SUPPORT_PYTHON_ABIS="1"
    PYTHON_DEPEND="2:2.6"
    # 2.4 is restricted due to relative imports and except...as syntax
    # 2.5 is restricted due to except...as syntax
    # 3.x is restricted due to print command
    RESTRICT_PYTHON_ABIS="2.[45] 3.*"

:file:`watch` files
-------------------

Each package directory contains a :file:`watch` file that is used to generate
:file:`support/cupage.conf`.  The :file:`support/cupage.conf` file is a config
file for cupage_, which helps us to keep up with new package releases by
automating the process of checking project sites.

The format is basically quite simple, but there are a few caveats.  First, an
easy example from ``www-client/cupage``:

.. code-block:: cfg

    site = github
    user = JNRowe

This configuration is all that is needed to check for new tags in the
``JNRowe/cupage`` project on GitHub_.

The output of :program:`cupage.py --list-sites` shows all the possible
definitions for the ``site`` option.  If the upstream project is located on one
of those sites then the :file:`watch` file should be extremely simple.

For projects not using one of :program:`cupage`'s supported sites a manual
matcher must be built.  An example from ``dev-python/astral`` should be
quite illustrative:

.. code-block:: cfg

    url = http://www.sffjunkie.co.uk/python-astral.html
    select = td a
    match_type = zip

This tells :program:`cupage` to check the defined URL for ``a`` tags located
within ``td`` tags whose ``href`` attributes appear to match ``zip`` file names.

For more information about configuring :program:`cupage` visit the cupage_
documentation.

Caveats
'''''''

If the package name does not match the project name then the project name must
be specified in the :file:`watch` file.  A live example from this repository
would be ``games-action/reminiscence``:

.. code-block:: cfg

    [REminiscence]
    url = http://cyxdown.free.fr/reminiscence/
    select = ul a

.. note::

   Project names are almost always case-sensitive, and project names must be
   specified when the package and project names differ as in the REminiscence_
   example above.

For a live ``ebuild``, or an upstream that has since disappeared, where using
:program:`cupage` is unworkable a special entry should be placed in a package's
:file:`watch` file.

For a live ``ebuild`` add the string ``# Live ebuild`` to the start of the
file.  It is possible to add other information to the end of the file.

For a package where the upstream site is dead add the string ``upstream is
dead`` somewhere in the watch file.  It is possible to add informative notes to
the file, such as the previous location or package author data.

.. _devmanual: http://devmanual.gentoo.org/
.. _org-mode: http://www.orgmode.org/
.. _rad: http://pypi.python.org/pypi/rad/
.. _cupage: http://jnrowe.github.com/cupage
.. _GitHub: https://github.com/
.. _REminiscence: http://cyxdown.free.fr/reminiscence/
