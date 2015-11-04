.PHONY: all dev test py upd-cat install-arch \
	install-arch-pkgs install-yaourt virtualenv
YAOURT=yaourt

LPYTHON=python3
V=$(PWD)/$(LPYTHON)
VB=$(V)/bin
PYTHON=$(VB)/$(LPYTHON)
ROOT=$(PWD)

env:	virtualenv
	[ -d $(V) ] || virtualenv  $(V)
	$(VB)/easy_install --upgrade pip
	$(VB)/easy_install --upgrade setuptools

virtualenv:
	@which virtualenv > /dev/null || make install-arch
	@which virtualenv > /dev/null

all: test

dev:
	make -C icc.cellula dev

test:
	make -C icc.cellula test

py:
	make -C icc.cellula py

upd-cat:
	make -C icc.cellula upd-cat

install-arch: install-yaourt install-arch-pkgs

install-yaourt:
	@which $(YAOURT) > /dev/null || echo "Install yaourt according to https://archlinux.fr/yaourt-en." 
	@which $(YAOURT) 2> /dev/null >/dev/null

install-arch-pkgs:
	$(YAOURT) --needed --noconfirm -S `cat arch-yaourt-pkglist.txt`
