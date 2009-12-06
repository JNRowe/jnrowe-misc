misc-overlay
============

Packages that don't naturally fit in to my other themed overlays.

If you find any problems with ebuilds in this overlay either drop me an
email_ or file an issue_.  Locally bugs are managed with ditz_, so if
you're working with a clone of the repository you can report, list and
fix bugs using ``dev-util/ditz``.

Contributors
------------

I'd like to thank the following people who have contributed to this repository.
I'm updating this list here as the history was dropped when the move to GitHub_
happened.

Patches
'''''''

* Bashshar Qaraja Maloof
* Leon Bird
* Matt Leighton
* Rachel Holmes

Bug reports
'''''''''''

* Erin Sandusky
* Fabien Courtois
* Jens Wulf
* Jesper Tremblay
* Kristian Cole
* Shi Tang
* cookiemon5ter

Ideas
'''''

* Jamie Ashton
* Ryan Lewis
* Scott Hunter
* Tony McKenzie

If I've forgotten to include your name I wholeheartedly apologise.  Just drop me
an email_ and I'll update the list!

``layman`` integration
----------------------

If you use layman_ to sync your repositories you can simply add this
repository to the supported list.

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

**Note**: You may need to run ``layman --fetch`` or perform a sync operation
before this command will work.

To sync the repository you can use ``layman`` directly, either syncing just
this overlay or all your overlays at once::

    # layman -s jnrowe-misc # Sync just jnrowe-misc
    # layman -S # or sync all layman managed overlays

Or if you're an eix_ user you can use ``eix-sync`` to update the repositories
and the ``eix`` database at the same time, first tell ``eix-sync`` to update
the repository::

    # echo "jnrowe-misc" >>/etc/eix-sync.conf # Sync just jnrowe-misc
    # echo "*" >>/etc/eix-sync.conf # or sync all layman managed overlays

Finally, use ``eix-sync`` to update the specified repositories and ``eix``
package database.

``cupage`` integration
----------------------

cupage_ is used to keep packages in sync with their releases, see
``support/cupage.conf``.  ``cupage`` v0.3.0, or above, is required if you wish
to make use of this functionality.

.. _email: jnrowe@gmail.com
.. _issue: http://github.com/JNRowe/misc-overlay/issues
.. _ditz: http://ditz.rubyforge.org/
.. _layman: http://layman.sourceforge.net
.. _eix: http://eix.sourceforge.net
.. _cupage: http://github.com/JNRowe/cupage
.. _GitHub: http://github.com/

