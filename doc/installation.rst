Installation
============

``oilman`` integration
----------------------

If you use :program:`oilman` to manage your repositories you can call::

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

If you're using :program:`layman` v1.2.4 or newer, then the
:file:`support/layman2.xml` should be added to the ``overlays`` section of
:file:`/etc/layman/layman.conf`, for example::

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                https://github.com/JNRowe/misc-overlay/raw/master/support/layman2.xml

If you're using :program:`layman` v1.2.3 or earlier, then
:file:`support/layman.xml` should be added to the ``overlays`` section of
:file:`/etc/layman/layman.conf`, for example::

    overlays  : http://www.gentoo.org/proj/en/overlays/layman-global.txt
                https://github.com/JNRowe/misc-overlay/raw/master/support/layman.xml

Then you can add the overlay using :command:`layman`::

    # layman -a jnrowe-misc

.. note::
   You may need to run :command:`layman --fetch` or perform a sync
   operation before this command will work.

To sync the repository you can use :command:`layman` directly, either
syncing just this overlay or all your overlays at once::

    # layman -s jnrowe-misc # Sync just jnrowe-misc
    # layman -S # or sync all layman managed overlays

Or if you're an eix_ user you can use :command:`eix-sync` to update
the repositories and the :program:`eix` database at the same time, first tell
:command:`eix-sync` to update the repository::

    # echo "jnrowe-misc" >>/etc/eix-sync.conf # Sync just jnrowe-misc
    # echo "*" >>/etc/eix-sync.conf # or sync all layman managed overlays

Finally, call :command:`eix-sync` to update the specified repositories
and the :program:`eix` package database.

Manual installation
-------------------

To manually manage this overlay just clone the `git repository`_ to a location
accessible by :program:`portage`, and edit :file:`/etc/make.conf`'s
:envvar:`PORTDIR_OVERLAY` setting.  See the :manpage:`make.conf(5)` manual page
for details.

.. _rsync: http://rsync.samba.org/
.. _layman: http://layman.sourceforge.net
.. _eix: http://eix.sourceforge.net
.. _git repository: https://github.com/JNRowe/misc-overlay/
