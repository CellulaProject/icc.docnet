.PHONY: all dev test

all: test

dev:
	make -C icc.cellula dev

test:
	make -C icc.cellula test
