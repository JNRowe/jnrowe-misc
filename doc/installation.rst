Installation
============

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

If you use layman_ to sync your repositories you can easily add this repository
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

Manual installation
-------------------

To manually manage this overlay just clone the `git repository`_ to a location
accessible by ``portage``, and edit ``/etc/make.conf``'s ``PORTDIR_OVERLAY``
setting.  See the ``make.conf(5)`` manual page for details.

.. _rsync: http://rsync.samba.org/
.. _layman: http://layman.sourceforge.net
.. _eix: http://eix.sourceforge.net
.. _git repository: https://github.com/JNRowe/misc-overlay/

