.PHONY: all dev test py

all: test

dev:
	make -C icc.cellula dev

test:
	make -C icc.cellula test

py:
	make -C icc.cellula py
