Contributing
============

A few notes, beyond the advice in the excellent devmanual_, that should be taken
in to consideration when contributing to this overlay.

Package naming
--------------

The devmanual's suggestion that filenames should not contain uppercase
characters only causes complex :envvar:`PN`/:envvar:`P` rewriting or
duplication, and as such is ignored in this overlay.

Commit messages
---------------

Commit messages should be of the form ``[<pkg>] <summary>``, or simply
``<summary>`` for commits that aren't bound to a single package.

Try to follow Tim Pope's excellent `commit message advice`_.  There is some
leeway on the length of the summary to take in to account the package prefix,
but beyond that the rules make perfect sense here.

.. note::

   Occasionally *I* forget or mis-step on the above rule, and from
   today(2013-04-05) I'll owe you a coffee every time you point out an
   infraction.  Take advantage, it is the only way I'll learn!

.. _commit message advice: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

Patches vs :command:`sed`
-------------------------

It is common practice in Gentoo repositories to fix minor problems using
:command:`sed`, presumably because it appears to be quick and easy.  This type
of usage is *banned* in this overlay.  Some of the reasons for this policy are:

* It is very easy to mis-apply transformations
* It is very easy for transformations to not be applied at all without anyone
  noticing
* For people with poor knowledge of :command:`sed` it leads to horrendous use of
  grouping and back-references
* Well written, correctly addressed, :command:`sed` expressions tend to be hard
  for people with only a basic knowledge of the ``s`` command to comprehend(far
  harder than unified diff output)
* Many people seem to misunderstand what the common ``sed || die`` construct
  does, leading to a false sense of safety.  [And frankly, if your
  :command:`die` calls are triggered because of missing or mispelt files there
  are much greater problems than a poorly defined call to :command:`sed`.]

.. note::

   Users inside the AST firewall often rely on our :command:`sed` wrappers to
   alert them of broken :command:`sed` usage, and that process isn't changing.
   I'm not applying this rule to all the overlays I maintain, just ones for
   external users.

:command:`die` usage
--------------------

There are few differences between how :command:`die` is commonly used in the
upstream tree, and how it is used in this overlay.  The rules in the overlay
aren't always strictly enforced, but documenting this will hopefully reduce the
number of usage questions I'm asked.

:command:`do*` and :command:`die`
'''''''''''''''''''''''''''''''''

It is common practise within the main Gentoo repository that calls to the likes
of :command:`dodoc` or :command:`doman` do not call :command:`die` on failure.
This is *not* acceptable in this overlay.

Usage of wildcards in calls to :command:`do*` is also frowned upon, but not
enough to clean up previous usage [yet].

All entities that should be installed should raise a failure if they are not
installed, there is no middle ground for some specific types of files.

:envvar:`HOMEPAGE` usage
------------------------

Against the advice given in the `ebuild variables`_ section of the devmanual_,
you should feel free to refer to variables in the :envvar:`HOMEPAGE` definition.

Even within the upstream repository this advice is seemingly ignored at will, as
it serves little purpose.

:envvar:`RESTRICT` usage
------------------------

All usage of :envvar:`RESTRICT` in an ``ebuild`` should be accompanied by an
explanation of the reason for the restriction.  It should be obvious to someone
looking at an ``ebuild`` the reason why tests, for example, are blocked for a
given package.

Of course, it is preferable to fix the underlying reason for needing
a :envvar:`RESTRICT` definition, especially in the case of ``test`` and
``userpriv`` restrictions.

.. _stabilisation.rem:

:file:`stabilisation.rem`
-------------------------

:file:`support/stabilisation.rem` is a remind_ compatible data file that
contains the *best case* stabilisation dates for packages.  When a new arch
keyword is added, or a package receives a version bump, this file is updated to
reflect the earliest possible time a package can migrate to stable.

The format is simple enough::

    REM <|stable_date|> *1 MSG %"Stabilise |arch| |CPV|%" %a

.. note::

   The initial ``stable date`` value is 30 days in the future, although it can
   be longer if more testing is likely to be necessary.

.. _package.mask:

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
:program:`support/gen_removal.py` script to create an remind_ compatible data
file.

A simple, but important, extension that makes it easier to keep on top of
important admin tasks.

:file:`distutils-r1.eclass` usage
----------------------------------

When using the ``PYTHON_COMPAT`` functionality from :file:`distutils-r1.eclass`
it is important to state the reason why a certain Python version isn't
supported.

This should, in theory, make it easier to track updates.  Also, it should make
it immediately clear how much work is required to support a specific Python
version if the need arises.

A simple example from the ``ebuild`` for rad_ would be:

.. code-block:: bash

    # 2.5 is restricted due to except...as syntax
    # 3.x is restricted due to print command
    PYTHON_COMPAT=(python2_{6,7})

You should feel free to use nested brace expansion and sequence expressions in
the ``PYTHON_COMPAT`` declaration, it makes for far more readable definitions
than either of the methods preferred upstream.  Compare upstream's
``colorama`` package::

    PYTHON_COMPAT=( python2_5 python2_6 python2_7 python3_1 python3_2 )

or upstream's ``pep8`` package where brace expansion is used::

    PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2,3_3} )

with the preferred style for this overlay using ``flake8`` as an example::

    PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

:file:`distutils.eclass` usage
------------------------------

.. important::

   At this point you should not be using :file:`distutils.eclass` for ebuilds,
   use :file:`distutils-r1` for all new packages and upgrade packages when
   bumping.

When using the ``RESTRICTED_PYTHON_ABIS`` functionality from
:file:`distutils.eclass` it is important to state the reason why a certain
Python version is restricted.  See `distutils-r1` for more information.

A simple example from an old ``ebuild`` for rad_ would be:

.. code-block:: bash

    SUPPORT_PYTHON_ABIS="1"
    PYTHON_DEPEND="2:2.6"
    # 2.4 is restricted due to relative imports and except...as syntax
    # 2.5 is restricted due to except...as syntax
    # 3.x is restricted due to print command
    RESTRICT_PYTHON_ABIS="2.[45] 3.*"

.. _watch files:

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

This tells :program:`cupage` to check the defined URL for ``a`` tags that are
descendants of ``td`` tags, and whose ``href`` attributes appear to match
``zip`` file names.

For more information about configuring :program:`cupage` visit the cupage_
documentation.

Caveats
'''''''

If the package name does not match the project name then the project name must
be specified in the :file:`watch` file.  A live example from this repository
would be ``dev-python/straight-plugin``:

.. code-block:: cfg

    [straight.plugin]
    site = pypi

.. note::

   Project names are almost always case-sensitive, and project names must be
   specified when the package and project names differ as in the example above.

For a live ``ebuild``, or an upstream that has since disappeared, where using
:program:`cupage` is unworkable a special entry should be placed in a package's
:file:`watch` file.

For a live ``ebuild`` add the string ``# Live ebuild`` to the start of the
file.  It is possible to add other information to the end of the file.

For a package where the upstream site is dead add the string ``upstream is
dead`` somewhere in the watch file.  It is possible to add informative notes to
the file, such as the previous location or package author data.

.. _devmanual: http://devmanual.gentoo.org/
.. _ebuild variables: http://devmanual.gentoo.org/ebuild-writing/variables/index.html
.. _remind: http://www.roaringpenguin.com/products/remind
.. _rad: https://pypi.python.org/pypi/rad/
.. _cupage: http://cupage.readthedocs.io/
.. _GitHub: https://github.com/
.. _REminiscence: http://cyxdown.free.fr/reminiscence/
