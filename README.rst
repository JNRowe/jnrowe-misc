jnrowe-misc
===========

.. important::

    As of 2014-06-26, the ``jnrowe-misc`` repository is shuttered.  The
    environments where I use Gentoo have vanished, and I don't expect any to
    arise in the near future.

    I plan on maintaining the packages in this overlay for as long as people
    report bugs, but won't promise speedy bug resolution.

    What this repository really needs is a new maintainer, so if you're a user
    it is time to step up!

This repository is for packages that don't naturally fit in to my other themed
overlays.

If you find any problems with this overlay then please either file an issue_ or
drop me an email_.

.. warning::

   This repository uses thin manifests, which requires a moderately recent
   version of ``portage`` to function correctly(2.1.10.18 or newer).  Using
   older versions is not supported!

You can read the `full documentation`_ online, or in the ``doc`` directory if
you prefer the reST source.

Contributors
------------

I'd like to thank the following people who have contributed to this repository.

Patches
'''''''

* Leon Bird
* Rachel Holmes
* Matt Leighton
* Bashshar Qaraja Maloof

Bug reports
'''''''''''

* Jake Archer
* Daniel Brew
* Dennis Bruce
* Kristian Cole
* Fabien Courtois
* Stephen Cutts
* Ed Lyle
* anna ruda
* Erin Sandusky
* Shi Tang
* Jesper Tremblay
* Matthew Turner
* Jens Wulf

Ideas
'''''

* Jamie Ashton
* Robert Kincade
* Scott Hunter
* Ryan Lewis
* Tony McKenzie
* Patrick Sauvé

If I've forgotten to include your name I wholeheartedly apologise.  Just drop me
an email_ and I'll update the list!

.. note::

   Some of these contributors pre-date the move to GitHub_, but if you have
   access to the AST overlay you can see their contributions in its repository
   history.

``oilman`` integration
----------------------

If you use ``oilman`` to manage your repositories you can call::

    # oilman --add-repository jnrowe::misc

Or, if you'd rather use the rsync_ mirror::

    # oilman --method=rsync --add-repository jnrowe::misc

To sync the repository::

    # oilman --sync jnrowe::misc  # Sync this repository only
    # oilman --sync all  # or sync all repositories

``layman`` integration
----------------------

If you use layman_ to sync your repositories you can easily add this repository
to the supported list.

If you're using layman v1.2.4 or newer, then the ``support/layman2.xml`` should
be added to the ``overlays`` section of ``/etc/layman/layman.conf``, for
example::

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                https://github.com/JNRowe/jnrowe-misc/raw/master/support/layman2.xml

If you're using layman v1.2.3 or earlier, then ``support/layman.xml`` should be
added to the ``overlays`` section of ``/etc/layman/layman.conf``, for example::

    overlays  : http://www.gentoo.org/proj/en/overlays/layman-global.txt
                https://github.com/JNRowe/jnrowe-misc/raw/master/support/layman.xml

Then you can add the overlay using ``layman``::

    # layman -a jnrowe-misc

.. note::
   You may need to run ``layman --fetch`` or perform a sync operation before
   this command will work.

To sync the repository you can use ``layman`` directly, either syncing just this
overlay or all your overlays at once::

    # layman -s jnrowe-misc  # Sync just jnrowe-misc
    # layman -S  # or sync all layman managed overlays

Or if you're an eix_ user you can use ``eix-sync`` to update the repositories
and the ``eix`` database at the same time, first tell ``eix-sync`` to update the
repository::

    # echo "jnrowe-misc" >>/etc/eix-sync.conf  # Sync just jnrowe-misc
    # echo "*" >>/etc/eix-sync.conf  # or sync all layman managed overlays

Finally, call ``eix-sync`` to update the specified repositories and ``eix``
package database.

``cupage`` integration
----------------------

cupage_ is used to keep packages in sync with their releases, see
``support/cupage.conf``.  ``cupage`` v0.5.5, or above, is required if you wish
to make use of this functionality.

.. _email: jnrowe@gmail.com
.. _issue: https://github.com/JNRowe/jnrowe-misc/issues
.. _full documentation: http://jnrowe-misc.readthedocs.io/
.. _layman: http://layman.sourceforge.net
.. _eix: http://eix.sourceforge.net
.. _cupage: https://github.com/JNRowe/cupage
.. _GitHub: https://github.com/
.. _rsync: http://rsync.samba.org/
