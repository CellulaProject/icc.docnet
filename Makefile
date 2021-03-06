.PHONY: all dev test py upd-cat install-arch \
	install-arch-pkgs install-yaourt virtualenv adjust-ini \
	rm-data install-swi-prolog pengines term prep \
	pyenv develop index-show index-show-full index-show-debug

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
DOCNET_PYENV=icc.docnet
DOCNET_PYENV_DIR=$(HOME)/.pyenv/versions/$(DOCNET_PYENV)

all: test

env:	virtualenv
	[ -d $(V) ] || virtualenv  $(V)
	$(VB)/easy_install --upgrade pip
	$(VB)/easy_install --upgrade setuptools
	[ -d $(DATA_DIR) ] || mkdir -p $(DATA_DIR){tmp,indexes,rdf}

virtualenv:
	@which virtualenv > /dev/null || make install-arch
	@which virtualenv > /dev/null

dev: env
	cd icc.cellula && make dev
	# [ -f $(VL)/$(SPHINXPY) ] || ln -sf $(SPHINXPYDIR)/$(SPHINXPY) $(VL)/$(SPHINXPY)
	cd pengines && $(PYTHON) setup.py develop

prep: 	git-rec dev

git-rec:
	git submodule update --init --recursive
	git submodule update --recursive

test:	adjust-ini
	cd icc.cellula && make test

adjust-ini:
	cd icc.cellula && make adjust-ini

py:
	$(PYTHON)

upd-cat:
	cd icc.cellula && make upd-cat

install-arch: install-yaourt install-arch-pkgs install-swi-prolog

install-yaourt:
	@which $(YAOURT) > /dev/null || echo "Install yaourt according to https://archlinux.fr/yaourt-en."
	@which $(YAOURT) 2> /dev/null >/dev/null

install-arch-pkgs:
	$(YAOURT) -Sy
	$(YAOURT) --needed --noconfirm -S `cat install/arch-yaourt-pkglist.txt`

install-swi-prolog:
	@echo "When asked to remove swi-prolog (a stable version) answer 'y'."
	#cd install/swi-prolog-devel && makepkg -si
	yaourt -G swi-prolog-devel || true
	cd swi-prolog-devel && makepkg -si

rm-data:
	rm -rf /home/eugeneai/tmp/cellula-data/{tmp/*,indexes/*,rdf/*,content.kch*}

pengines:
	screen -dm bash -c "cd swi/icc.pengines; swipl icc_pengines.pl"

term:
	terminator -l cc

pyenv:
	pyenv virtualenv system $(DOCNET_PYENV)
	pyenv local $(DOCNET_PYENV)
	ln -sf $(DOCNET_PYENV_DIR) python3
	$(DOCNET_PYENV_DIR)/bin/pip install --upgrade pip wheel setuptools

develop:
	# FIXME Check subprojects on uncommited and unpushed git data first!!!
	$(DOCNET_PYENV_DIR)/bin/pip install -r requirements-devel.txt
	cd $(DOCNET_PYENV_DIR)/src && pyenv local $(DOCNET_PYENV)

index-show-debug:
	DEBUG=10 SHORTEN=500 python3 $(DOCNET_PYENV_DIR)/src/icc.cellula/src/icc/cellula/indexer/scripts/indexfeeder.py

index-show:
	SHORTEN=500 python3 $(DOCNET_PYENV_DIR)/src/icc.cellula/src/icc/cellula/indexer/scripts/indexfeeder.py

index-show-full:
	python3 $(DOCNET_PYENV_DIR)/src/icc.cellula/src/icc/cellula/indexer/scripts/indexfeeder.py
