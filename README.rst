misc-overlay
============

Packages that don't naturally fit in to my other themed overlays.

If you find any problems with ebuilds in this overlay either file an issue_ or
drop me an email_.

Contributors
------------

I'd like to thank the following people who have contributed to this repository.
I'm updating this list here as the history was dropped when the move to GitHub_
happened.

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

Python multi-ABI support
------------------------

Where applicable Python packages in this repository support multiple Python
versions as specified in `Gentoo Python Developers Guide`_.  Unfortunately,
there are various problems such as broken dependency specification that can't be
worked around using the prescribed method.

Please, read the ebuild's dependency specification and try to resolve the
problem yourself before reporting bugs.  There is very little that can be done
to fix this without breaking compatibility with upstream, so bugs relating to
multiple ABI support will likely be closed as CANTFIX.

Hopefully upstream will fix or acknowledge the breakages soon, and then this can
be resolved correctly.

``oilman`` integration
----------------------

If you use ``oilman`` to manage your repositories you can call::

    # oilman --add-repository jnrowe::misc

Or, if you'd rather use the rsync_ mirror::

    # oilman --method=rsync --add-repository jnrowe::misc

To sync the repository::

    # oilman --sync jnrowe::misc # Sync this repository only
    # oilman --sync all # or sync all repositories

``layman`` integration
----------------------

If you use layman_ to sync your repositories you can simply add this repository
to the supported list.

If you're using layman v1.2.4 or newer, then the ``support/layman2.xml`` should
be added to the ``overlays`` section of ``/etc/layman/layman.conf``, for
example::

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                file:///var/lib/repos/jnrowe-misc/support/layman2.xml

If you're using layman v1.2.3 or earlier, then ``support/layman.xml`` should be
added to the ``overlays`` section of ``/etc/layman/layman.conf``, for example::

    overlays  : http://www.gentoo.org/proj/en/overlays/layman-global.txt
                file:///var/lib/repos/jnrowe-misc/support/layman.xml

Then you can add the overlay using ``layman``::

    # layman -a jnrowe-misc

.. note::
   You may need to run ``layman --fetch`` or perform a sync operation before
   this command will work.

To sync the repository you can use ``layman`` directly, either syncing just this
overlay or all your overlays at once::

    # layman -s jnrowe-misc # Sync just jnrowe-misc
    # layman -S # or sync all layman managed overlays

Or if you're an eix_ user you can use ``eix-sync`` to update the repositories
and the ``eix`` database at the same time, first tell ``eix-sync`` to update the
repository::

    # echo "jnrowe-misc" >>/etc/eix-sync.conf # Sync just jnrowe-misc
    # echo "*" >>/etc/eix-sync.conf # or sync all layman managed overlays

Finally, call ``eix-sync`` to update the specified repositories and ``eix``
package database.

``cupage`` integration
----------------------

cupage_ is used to keep packages in sync with their releases, see
``support/cupage.conf``.  ``cupage`` v0.5.2, or above, is required if you wish
to make use of this functionality.

.. _email: jnrowe@gmail.com
.. _issue: https://github.com/JNRowe/misc-overlay/issues
.. _layman: http://layman.sourceforge.net
.. _eix: http://eix.sourceforge.net
.. _cupage: https://github.com/JNRowe/cupage
.. _GitHub: https://github.com/
.. _rsync: http://rsync.samba.org/
.. _Gentoo Python Developers Guide: http://www.gentoo.org/proj/en/Python/developersguide.xml

..
    vim: set ft=rst ts=4 sw=4 tw=80 et:
