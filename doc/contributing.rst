Contributing
============

There are few notes beyond the advice in the excellent devmanual_ that should be
taken in to consideration when contributing to this overlay.

stabilisation.remind
--------------------

:file:`support/stabilisation.remind` is a remind_ compatible data file that
contains *likely* stabilisation dates for packages.  When a new arch keyword is
added or a package receives a version bump this file is updated to reflect the
earliest possible time a package can migrate to stable.

The format is simple enough::

    REM <stable date> *1 +1 UNTIL 2038-01-19 MSG Stabilise <arch> <CPV> %a

.. note::

   The initial ``stable date`` value is 30 days in the future, although it can
   be longer if more testing is likely to be necessary.

package.mask
------------

The :file:`profiles/package.mask` file includes special syntax for generating
removal reminders for packages.  An example should explain it adequately::

    # James Rowe <jnrowe@gmail.com> (27 Jan 2011)
    # Better alternatives available including busybox's fbsplash, plymouth, ksplash
    # and many others.
    # X-Removal: 2011-02-26
    media-gfx/psplash

The format is identical to that defined in :manpage:`portage(5)` with the
addition of the ``X-Removal`` tag that is used by the
:program:`support/gen_removal.py` script to create remind_ compatible data
files.

A simple, but important, extension that makes it easier to keep on top of admin
tasks.

.. _devmanual: http://devmanual.gentoo.org/
.. _remind: http://www.roaringpenguin.com/products/remind
