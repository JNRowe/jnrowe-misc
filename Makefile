REPO := $(shell cat profiles/repo_name)
CATEGORIES := $(wildcard *-*)
HTML := $(patsubst %.rst, %.html, $(wildcard *.rst))
PACKAGES := $(wildcard *-*/*)
MANIFESTS := $(addsuffix /Manifest, $(PACKAGES))
METADATA := $(addsuffix /metadata.xml, $(PACKAGES))
NEWS := $(addsuffix .asc, $(wildcard metadata/news/*/*.txt))

SIGN_KEY := $(shell . /etc/make.conf ; echo $$PORTAGE_GPG_KEY)
ifndef SIGN_KEY
    $(warning Manifests will not be signed, as PORTAGE_GPG_KEY is not set)
endif

.PHONY: clean check cupage-check distclean layman-check stable-candidates \
    removal-reminders

all: $(HTML) profiles/categories profiles/use.local.desc $(MANIFESTS) \
	$(NEWS) support/cupage.conf stable-candidates removal-reminders

%.html: %.rst
	rst2html.py --strict $< $@

%/Manifest: %/*.ebuild %/ChangeLog %/metadata.xml
	ebuild $(lastword $(wildcard $(dir $@)*.ebuild)) manifest; \
	if [ -n "$(SIGN_KEY)" ]; then \
		gpg --local-user $(SIGN_KEY) --clearsign $@; \
		mv $@.asc $@; \
	fi

%.txt.asc: %.txt
	[ -z "$(SIGN_KEY)" ] && exit 1 || true
	rm -f $@
	gpg --local-user $(SIGN_KEY) --detach-sign --armor $<

profiles/categories: $(CATEGORIES)
	rm -f $@; \
	for cat in $(CATEGORIES); do echo $$cat >>$@; done

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

check: cupage-check layman-check

cupage-check:
	for i in $(PACKAGES); do \
		name=$${i#*/}; \
		grep -qi "\[$$name\]" support/cupage.conf || echo $$i; \
	done

layman-check: $(patsubst %, layman-check-%, layman.xml layman2.xml)
layman-check-%: support/%
	xmllint --noout $<
