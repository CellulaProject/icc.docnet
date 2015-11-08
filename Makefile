.PHONY: all dev test py upd-cat install-arch \
	install-arch-pkgs install-yaourt virtualenv adjust-init \
	rm-data
YAOURT=yaourt

LPYTHON=python3
V=$(PWD)/$(LPYTHON)
VB=$(V)/bin
VL=$(V)/lib/python3.5/site-packages
PYTHON=$(VB)/$(LPYTHON)
ROOT=$(PWD)
DATA_DIR=$(HOME)/tmp/cellula-data/
SPHINXPY=sphinxapi.py
SPHINXPYDIR=/usr/share/sphinx/lib

env:	virtualenv
	[ -d $(V) ] || virtualenv  $(V)
	$(VB)/easy_install --upgrade pip
	$(VB)/easy_install --upgrade setuptools
	[ -d $(DATA_DIR) ] || mkdir -p $(DATA_DIR){tmp,indexes,rdf}

virtualenv:
	@which virtualenv > /dev/null || make install-arch
	@which virtualenv > /dev/null

all: test

dev: env
	cd icc.cellula && make dev
	# [ -f $(VL)/$(SPHINXPY) ] || ln -sf $(SPHINXPYDIR)/$(SPHINXPY) $(VL)/$(SPHINXPY)

test:	adjust-init
	cd icc.cellula && make test

adjust-ini:
	cd icc.cellula && make adjust-ini

py:
	$(PYTHON)

upd-cat:
	cd icc.cellula && make upd-cat

install-arch: install-yaourt install-arch-pkgs

install-yaourt:
	@which $(YAOURT) > /dev/null || echo "Install yaourt according to https://archlinux.fr/yaourt-en." 
	@which $(YAOURT) 2> /dev/null >/dev/null

install-arch-pkgs:
	$(YAOURT) --needed --noconfirm -S `cat arch-yaourt-pkglist.txt`

rm-data:
	rm -rf /home/eugeneai/tmp/cellula-data/{tmp/*,indexes/*,rdf/*,content.kch*}