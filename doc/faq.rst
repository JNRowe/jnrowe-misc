Frequently Asked Questions
==========================

.. It really is about time I wrote this, and it has been for a few years ;)

Why don't you submit these to Bugzilla?
---------------------------------------

At one time I did submit new ``ebuilds`` to Gentoo's bugzilla, but it tended to
be *very* unproductive for *me*.

The purpose of this overlay is to provide packaging for things I use, and that
means they're used *today*.

Resolution for new package bugs tends to take an awful lot of time(if it happens
at all), and when they are resolved there are occasionally incompatible changes
made.  Each incompatible change means I get to make the choice of whether
I attempt to shift our users to the in-tree version via some possibly hairy
migration path, or simply continue to maintain the out of tree ``ebuild``
indefinitely.

Basically the end result is just far more work, with fast approaching zero
benefit from upstreaming.  To see the amount of work involved check out
``::shadow``, it only exists to handle packages with migration issues and it
demonstrates the situation quite well.

Why isn't this listed in the layman repo?
-----------------------------------------

I've never used ``layman``, so it isn't something I would test very often.

A few users have asked in the past, but they normally find the
:doc:`installation` method for ``layman`` satisfies their needs when it is
pointed out.  Perhaps, it could be more discoverable(ideas how to make it so are
very welcome).

Why are there so many merge commits?
------------------------------------

As a result of the way my overlays are managed I have to maintain a bunch of
different branches to work around supporting the many different configurations;
on top of ``gentoo-x86``, stacked on the EADS main tree, using upstream's python
eclasses, &c.  The simplest way to do it is using a very heavy branching
structure.

If you scroll back through the repository history to a time when I wasn't
supporting people using portage as their package manager or ``gentoo-x86`` as
a base, you'll see the history was a lot cleaner.
