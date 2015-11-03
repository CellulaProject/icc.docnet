.PHONY: all dev test py upd-cat

all: test

dev:
	make -C icc.cellula dev

test:
	make -C icc.cellula test

py:
	make -C icc.cellula py

upd-cat:
	make -C icc.cellula upd-cat