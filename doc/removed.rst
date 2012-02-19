Dead packages
=============

This page lists packages that have been removed from this overlay for various
reasons.  You can use it to find pointers to their new locations for moved
packages, or perhaps to find the last available ``ebuild`` if they were simply
culled.

.. warning::

   This document is *almost* entirely generated using ``git show``.  If an entry
   doesn't make sense take a look at the referenced commit for the full context.

``app-admin``
~~~~~~~~~~~~~

``stow``
''''''''

    This was causing problems with the ``kinesis`` resolver.

:Reason: Moved to ``::shadow``
:Commit: 6a24dd9c97515b41e1d9bd68d4ff3f1674002a6b
:Removal date: 2011-09-13

``app-text``
~~~~~~~~~~~~

``gist-9999``
'''''''''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: 3bdea61f4884a5dfc1c54e0cb9bf16306485221c
:Removal date: 2011-09-13

``app-vim``
~~~~~~~~~~~

``rails``
'''''''''

    This was causing problems with the ``kinesis`` resolver.

:Reason: Moved to ``::shadow``
:Commit: 274adfb03c017c6fe590b5ae1adf3d7f927171cd
:Removal date: 2011-09-13

``snipmate``
''''''''''''

    Available in the main tree.

:Reason: Moved to ``::shadow``
:Commit: 9073e7c02eca64dd7dbc8d654414c5bbfc9a8c74
:Removal date: 2011-09-13

``dev-lua``
~~~~~~~~~~~

``luasocket``
'''''''''''''

    Available in the main tree.

:Reason: Moved to ``::shadow``
:Commit: e6cbe7161dea24cfa98abb873813bce5fd6f8850
:Removal date: 2009-09-29

``dev-haskell``
~~~~~~~~~~~~~~~

``configfile``
''''''''''''''

    Only used by ``hpodder``, which has been removed.

:Reason: Culled
:Commit: 9f8612632f97e54a92aa3a605e106d44aa941ff4
:Removal date: 2010-09-24

``hpodder``
'''''''''''

    Haskell support was too brittle to keep this, and ``castget`` is
    a reasonable replacement.

:Reason: Culled
:Commit: ecf3e6886a0586acfb3fdd64b62ddf4a871b8486
:Removal date: 2010-09-24

``missingh``
''''''''''''''''''''''''

    Only used by ``hpodder``, which has been removed.

:Reason: Culled
:Commit: fbe106cc1f72bf684c5a1782b50773b7a4f1a763
:Removal date: 2010-09-24

``dev-python``
~~~~~~~~~~~~~~

``async``
'''''''''

    This was causing problems with the ``kinesis`` resolver.

:Reason: Moved to ``::shadow``
:Commit: 7ef5cf4b8ca09f4199f5677970c15c8132a3484f
:Removal date: 2011-09-13

``bpython``
'''''''''''

    Its line editing support is quite weak, and it provides little benefit over
    the standard ``python`` interpreter.  The level of maintenance needed was
    higher than the benefit it gave.

:Reason: Culled
:Commit: 36cf5f2e3d542acba23668658d19cb4cd9144ab7
:Removal date: 2009-08-12

``cleancss``
''''''''''''

    It didn't support enough CSS syntax to be usable for our needs.

:Reason: Culled
:Commit: 38a03c8326c6f61694f7cd41bc7556b6dc354f0e
:Removal date: 2010-09-21

``clevercss2``
''''''''''''''

    The implementation was not suitable for our needs

:Reason: Culled
:Commit: 89dffdfd2ec84a4259ce73819711f46b2f806cb4
:Removal date: 2010-09-21

``dulwich``
'''''''''''

    Available in the main tree.

:Reason: Moved to ``::shadow``
:Commit: d7b758eea5c3d344375e0e07773ee520b7e2417b
:Removal date: 2010-01-05

``gevent``
''''''''''

    This was only required by ``requests``, which has been removed.

:Reason: Culled
:Commit: 8373189cae83217b14ece3466b51b7eeb3d0f32e
:Removal date: 2012-01-16

``gistapi``
'''''''''''

    Masked for removal because the dependencies in new releases aren't
    supported on our deploy systems.

:Reason: Culled
:Commit: df715ff0624155460d12a74d245a4d4418794306
:Removal date: 2011-05-10

``gitdb``
'''''''''

    This was causing problems with the ``kinesis`` resolver.

:Reason: Moved to ``::shadow``
:Commit: 1bdc71fe54b695ed4e93b9a9828da165f4718284
:Removal date: 2011-09-13

``git-python``
''''''''''''''

    This was causing problems with the ``kinesis`` resolver.

:Reason: Moved to ``::shadow``
:Commit: 3384cfe90fd22f77fb8a1c4f1b9e999e2d75bb00
:Removal date: 2011-09-13

``logbook``
'''''''''''

    This was causing problems with the ``kinesis`` resolver.

:Reason: Moved to ``::shadow``
:Commit: bd89ae1b2eec91e50591c07c9b6b9ea4cea557ac
:Removal date: 2012-01-16

``pep8``
''''''''

    This was causing problems with the ``kinesis`` resolver.

:Reason: Moved to ``::shadow``
:Commit: 7b637d57ec60e1f6d04055370b99f094e4e71ccd
:Removal date: 2011-09-13

``poster``
''''''''''

    This was only needed by ``requests``, which has been removed.

:Reason: Culled
:Commit: 0195603d254d954ba75b0318426b8170840f6c12
:Removal date: 2012-01-16

``python-gnupg``
''''''''''''''''

    Alternatives exist, maintenance costs higher than benefit.

:Reason: Culled
:Commit: c350e281c851b12eb9c459d51f5d1d0db0fef4af
:Removal date: 2010-12-05

``rednose``
'''''''''''

    Doesn't work correctly with ``doctests``, alternatives exist.

:Reason: Culled
:Commit: 343993fe02cecbbdf1b57880e41b4e393a6345df
:Removal date: 2010-10-21

``requests``
''''''''''''

    New releases bundle libraries, which makes supporting this package quite
    laborious and prone to error.  Releases at the time of removal were
    not very stable.

    See ``mleighy`` if you need help porting packages with dependencies on
    ``requests`` to alternatives.

:Reason: Culled
:Commit: 050c16c71805668c9e21576f09efc2e4b692002d
:Removal date: 2012-01-16

``restview``
''''''''''''

    Buggy in places, and upstream is unfortunately on launchpad.  ``rstctl``
    provides similar functionality.

:Reason: Culled
:Commit: 9271790e1475cf035340c6d2ab9a0b31f44e431b
:Removal date: 2011-02-28

``rudolf``
''''''''''

    Significantly increased ``nose`` run time, and broke reporting for other
    plugins we commonly used.

:Reason: Culled
:Commit: 646671c0a6236338c1e17482834c7a3ae3b939e4
:Removal date: 2010-10-21

``scripttest``
''''''''''''''

    This was causing problems with the ``kinesis`` resolver.

:Reason: Moved to ``::shadow``
:Commit: 088ab46a2c1fdb110eab905692c15ebae262b952
:Removal date: 2011-09-13

``sphinx-to-github``
''''''''''''''''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: 740ada6bbcab5d5c0ad356eefa489299eada69a7
:Removal date: 2011-09-13

``termstyle``
'''''''''''''

    Unfortunately no longer packaged in a standard manner, and plenty of
    alternatives exist.

:Reason: Culled
:Commit: 06e15f172e696c40db3a369f0389aa34f9f9c28b
:Removal date: 2010-12-04

``virtualenv5``
'''''''''''''''

    No longer needed by ``tox``.

:Reason: Culled
:Commit: fe12bc3b40a1bfcb2e621564a7ac28818ac248c1
:Removal date: 2011-06-28

``dev-util``
~~~~~~~~~~~~

``be``
''''''

    Incompatible with new "releases", new code is too slow and far too buggy for
    everyday use.  Alternatives to ``Bugs Everywhere`` such as ``ditz`` exist.

:Reason: Culled
:Commit: b24e7c8e618b8c0f485f8dcdb2744b6275f8c5b1
:Removal date: 2010-04-04

``ditz``
''''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: d50583659e031f3487ecb8afd800175cf3f44611
:Removal date: 2011-09-13

``fossil``
''''''''''

    There is now a version in the tree, and the ``ebuilds`` will still exist in
    ``::fixes`` until a version has equal keywords.  The upgrade isn't exactly
    seamless, but shouldn't cause significant problems.

    Note the version numbers in the in-tree versions.

:Reason: Moved to ``::shadow``
:Commit: 1954746e2645ae789cf4aeba7fb5e5ca8985d803
:Removal date: 2010-01-26

``hg-git``
''''''''''

    Available in the main tree.

:Reason: Moved to ``::shadow``
:Commit: e4f47fae5ec7538d6121ab78c69bd0eca7e88482
:Removal date: 2009-12-08

``wingide``
'''''''''''

    The upstream packaging is a shocking mess.  Both versions supported by the
    ``ebuilds`` contain bundled releases of ``Python`` and ``GTK+`` with easily
    exploitable security vulnerabilities, and only the ``GTK+`` problems are
    easily worked around.

    After some months, nobody has stepped up to maintain the ``ebuilds`` beyond
    one-off bugfixes.

:Reason: Culled
:Commit: 52a983f50d5e41317c1b9282a5a0146e9a71c89f
:Removal date: 2010-02-27

``dev-vcs``
~~~~~~~~~~~

``git-sync``
''''''''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: a49d852e55d3c78b8eab1a18fdb6684345b152b7
:Removal date: 2011-09-13

``hub``
'''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: 2b66e43f7a5ef7a3dbc5ea9bbad966a408f8c5a2
:Removal date: 2011-09-13

``games-puzzle``
~~~~~~~~~~~~~~~~

``sgt-puzzles``
'''''''''''''''

    This still exists as we're waiting for a version to be stabilised.

:Reason: Moved to ``::shadow``
:Commit: 36eb5d0922efb058f8c0feea29564a9e4e5ae48e
:Removal date: 2010-01-08

``mail-client``
~~~~~~~~~~~~~~~

``notmuch``
'''''''''''

    There is an ``ebuild`` upstream for ``notmuch`` now, and the local version
    will be removed.  The upgrade path is incredibly ugly and some features are
    not supported, but this is a final decision as shadowing is even nastier.

:Reason: Moved to ``::shadow``
:Commit: 66e7659e2d393dff924062b06348bd4f6cb51043
:Removal date: 2011-12-13

``notmuch-gtk``
'''''''''''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: fe7077bca2118cfb7bda2c1544cd403b6b660d16
:Removal date: 2011-09-13

``media-gfx``
~~~~~~~~~~~~~

``psplash``
'''''''''''

    Better alternatives exist, including ``busybox``'s ``fbsplash`` and
    ``plymouth``.

    Closes #141.

:Reason: Culled
:Commit: 39fc52f8ff06e8a87c905f666fe73535fb8fe05a
:Removal date: 2011-02-26

``sxiv``
''''''''

    Package now exists upstream.

    Refs #457.

:Reason: Culled
:Commit: 523c04503755e308d1384cebe3bf4403dec5aa51
:Removal date: 2011-08-27

``media-sound``
~~~~~~~~~~~~~~~

``mpdcron``
'''''''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: 6ab396d748e197c7eaf307be4e9374a40ce65604
:Removal date: 2011-09-13

``net-irc``
~~~~~~~~~~~

``twirssi``
'''''''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: 9c9b2cf7baa0c8ec7e6fb1de447b3d6c1bac7e47
:Removal date: 2011-09-13

``net-mail``
~~~~~~~~~~~~

``rss2email``
'''''''''''''

    This one was a very, very, very long time coming...

    This can't be handled by just moving the current ``ebuild`` to ``::fixes``,
    as the upgrade path is fiercely ugly.  The in-tree ``ebuild`` installs to
    non-standard locations, has a lower version number and still isn't
    keyworded.

:Reason: Moved to ``::shadow``
:Commit: 2f09d163876dcc7832509844a7e6160598c8ed75
:Removal date: 2011-05-12

``sys-fs``
~~~~~~~~~~

``unionfs-fuse``
''''''''''''''''

    There is now a version in the tree, and the ``ebuilds`` will still exist in
    ``::fixes`` until a version has equal keywords.  See AST #249971 for some
    unfortunate details of the upgrade path.

:Reason: Moved to ``::shadow``
:Commit: 61af9a273236cf988095914cde2769b19c8d5a25
:Removal date: 2010-01-20

``www-apps``
~~~~~~~~~~~~

``rstblog``
'''''''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: 06351abddc94317d33f47c9f2643b0fad3cf5a0c
:Removal date: 2011-09-13

``www-client``
~~~~~~~~~~~~~~

``opera-remote``
''''''''''''''''

    Doesn't work with recent ``Opera`` versions.

:Reason: Culled
:Commit: 77683d8f8f9061c539be6dbfa1ede8386d0333e3
:Removal date: 2010-08-08

``surfraw``
'''''''''''

    This was causing problems with the ``kinesis`` resolver.

:Reason: Moved to ``::shadow``
:Commit: 29d5b3560f5271ca74ba69b505ecbfb6be938795
:Removal date: 2011-09-13

``x11-misc``
~~~~~~~~~~~~

``notify-osd``
''''''''''''''

    It really is unsupportable.

    Luckily this was never unmasked, so doesn't need a grace period.

:Reason: Moved to ``::shadow``
:Commit: d8741f966e518b7bba6e93744f16676d75674f34
:Removal date: 2011-06-02

``x11-plugins``
~~~~~~~~~~~~~~~

``obvious``
'''''''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: a240cd778395974c8267424dcea18a2f33625cfe
:Removal date: 2011-09-13`

``vicious``
'''''''''''

    Users should've be attempting to migrate to upstream ebuilds.

:Reason: Moved to ``::shadow``
:Commit: 9072fe6a9985758724f45d68a8825b1fb9f0491d
:Removal date: 2011-06-16

``x11-themes``
~~~~~~~~~~~~~~

``notify-osd-icons``
''''''''''''''''''''

    They're definitely very pretty, but without ``notify-osd`` they provide
    little additional value.

:Reason: Culled
:Commit: 0ccd124c287f12c78ed4771a078b281131dd04e9
:Removal date: 2011-07-02

``x11-wm``
~~~~~~~~~~

``matwm2``
''''''''''

    Moved to ``::fixes`` until a working version with equal keywords is
    available.

:Reason: Moved to ``::shadow``
:Commit: e36fcf7b61f68c74d3b3ddb505782a65a07c5517
:Removal date: 2010-01-06

``parti``
'''''''''

    Closes #6.

:Reason: Moved to ``::shadow``
:Commit: c3d01805b7faa124f507f80b635f0608030a4a5c
:Removal date: 2010-10-08

``subtle``
''''''''''

    It is unsupportable in its current state.

:Reason: Culled
:Commit: a6d131d358b51d677f1a24b8f01dbc887f13b781
:Removal date: 2010-03-04

``wmfs``
''''''''

    Maintenance is passing to ``mleighy``'s group.

:Reason: Moved to ``::live``
:Commit: a73b09d3ff9b249db075bb4d716201957dfb182f
:Removal date: 2011-09-13
