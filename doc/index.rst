.. jnrowe-misc documentation master file, created by
   sphinx-quickstart on Tue Feb  1 07:54:18 2011.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. _jnrowe-misc-label:

``jnrowe-misc`` - Gentoo overlay
=================================

.. important::

    As of 2014-06-26, the ``jnrowe-misc`` repository is shuttered.  The
    environments where I use Gentoo have vanished, and I don't expect any to
    arise in the near future. [#]_

    I plan on maintaining the packages in this overlay for as long as people
    report bugs, but won't promise speedy bug resolution.

    What this repository really needs is a new maintainer, so if you're a user
    it is time to step up!

``jnrowe-misc`` is for packages that don't naturally fit in to one of my other
themed overlays.  You'll find a large selection of Python_ packages, some tools
to make working with git_ more fun and various other things I can't live
without.

If you find any problems with an ``ebuild`` in this overlay either file an
issue_ or drop me an email_.

.. warning::

   This repository uses thin manifests, which requires a moderately recent
   version of ``portage`` to function correctly(2.1.10.18 or newer).  Using
   older versions is not supported!

This documentation reflects the overlay state as of |today|.

Contents
========

.. toctree::
   :maxdepth: 2

   installation
   packages
   thanks
   licence
   download
   maintenance
   cupage
   contact
   signing
   contributing
   faq
   appendix

Indices and tables
==================

* :ref:`genindex`
* :ref:`search`

.. [#]
   If you want to hear the many and varied reasons, ask me in person the next
   time we meet at a conference.  You'll be able to enjoy the relentless
   chadenfraude of my disappointment, and you'll win yourself a few free beers
   at the same time.

.. _Python: http://python.org/
.. _awesome: http://awesome.naquadah.org/
.. _git: http://www.git-scm.com/
.. _issue: https://github.com/JNRowe/jnrowe-misc/issues
.. _email: jnrowe@gmail.com
.. _viewed online: https://github.com/JNRowe/jnrowe-misc/blob/master/README.rst
