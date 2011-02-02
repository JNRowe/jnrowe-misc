REPO := $(shell cat profiles/repo_name)
CATEGORIES := $(wildcard *-*)
RST_FILES := $(wildcard *.rst)
HTML := $(patsubst %.rst, %.html, $(RST_FILES))
PACKAGES := $(wildcard *-*/*)
MANIFESTS := $(addsuffix /Manifest, $(PACKAGES))
METADATA := $(addsuffix /metadata.xml, $(PACKAGES))
NEWS := $(addsuffix .asc, $(wildcard metadata/news/*/*.txt))

SIGN_KEY := $(shell . /etc/make.conf ; echo $$PORTAGE_GPG_KEY)
ifndef SIGN_KEY
    $(warning Manifests will not be signed, as PORTAGE_GPG_KEY is not set)
endif

.PHONY: clean check cupage-check distclean doc layman-check stable-candidates \
    removal-reminders

all: $(HTML) profiles/categories profiles/use.local.desc $(MANIFESTS) \
	$(NEWS) support/cupage.conf stable-candidates removal-reminders

doc:
	$(MAKE) -C doc/ html

%.html: %.rst
	rst2html.py --strict $< $@

%/Manifest: %/*.ebuild %/ChangeLog %/metadata.xml
	ebuild $(lastword $(wildcard $(dir $@)*.ebuild)) manifest; \
	if [ -n "$(SIGN_KEY)" ]; then \
		gpg --local-user $(SIGN_KEY) --clearsign $@; \
		mv $@.asc $@; \
	fi

# Delete up front, if we can't sign we shouldn't leave stale signatures
%.txt.asc: %.txt
	rm -f $@
	[ -z "$(SIGN_KEY)" ] && exit 1 || true
	gpg --local-user $(SIGN_KEY) --detach-sign --armor $<

profiles/categories: $(CATEGORIES)
	echo $(CATEGORIES) | tr ' ' '\n' > $@

profiles/use.local.desc: $(METADATA)
	egencache --repo=$(REPO) --update-use-local-desc

clean:
	rm -f $(HTML) profiles/categories
distclean: clean
	rm -f $(MANIFESTS)

stable-candidates: support/stabilisation.remind
	remind $<

support/removal.remind: profiles/package.mask support/gen_removal.py
	support/gen_removal.py
removal-reminders: support/removal.remind
	remind $<

support/cupage.conf: $(patsubst %, %/watch, $(PACKAGES))
	support/gen_cupage_conf.py >$@

check: $(patsubst %, rst-check-%, $(RST_FILES)) cupage-check layman-check

rst-check-%: %
	rst2html.py --strict $< >/dev/null

# Make sure a watch file exists for each package
cupage-check: $(patsubst %, %/watch, $(PACKAGES))

layman-check: $(patsubst %, layman-check-%, layman.xml layman2.xml)
layman-check-%: support/%
	xmllint --noout $<
