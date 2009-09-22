CATEGORIES := $(wildcard *-*)
HTML := $(patsubst %.rst, %.html, $(wildcard *.rst))
PACKAGES := $(wildcard *-*/*)
MANIFESTS := $(addsuffix /Manifest, $(PACKAGES))
METADATA := $(addsuffix /metadata.xml, $(PACKAGES))

SIGN_KEY := $(shell . /etc/make.conf ; echo $$PORTAGE_GPG_KEY )

.PHONY: clean distclean

all: $(HTML) profiles/categories profiles/use.local.desc $(MANIFESTS)

%.html: %.rst
	rst2html.py $< $@

%/Manifest: %/*.ebuild
	ebuild $(lastword $(wildcard $(dir $@)*.ebuild)) manifest; \
	if [ -n "$(SIGN_KEY)" ]; then \
		gpg --local-user $(SIGN_KEY) --clearsign $@; \
		mv $@.asc $@; \
	fi

profiles/categories: $(CATEGORIES)
	rm -f $@; \
	for cat in $(CATEGORIES); do echo $$cat >>$@; done

profiles/use.local.desc: $(METADATA)
	./support/gen_use_local_desc.py

clean:
	rm -f $(HTML) profiles/categories
distclean: clean
	rm -f $(MANIFESTS)

