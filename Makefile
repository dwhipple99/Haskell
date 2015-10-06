GHC = ghc
GHCFLAGS = -odir obj -hidir obj

GHCFLAGS	+= \
	-hide-all-packages \
	-package HUnit \
	-package base \
	-package test-framework \
	-package test-framework-hunit \

#
# To support cabal sandbox
#
ifneq ($(wildcard .cabal-sandbox/*-packages.conf.d),)
GHCFLAGS += \
	-no-user-package-db \
	-package-db $(wildcard .cabal-sandbox/*-packages.conf.d)
endif

.PHONY : all
all : test

.PHONY : run-tests
run-tests : test
	./test --timeout=2

.PHONY : clean
clean :
	rm -rf test obj

test : Test.hs HW03.hs
	$(GHC) $(GHCFLAGS) -o $@ --make $^
