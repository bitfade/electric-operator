EMACS=emacs
CASK ?= cask

build :
	cask exec $(EMACS) -Q --batch --eval             \
	    "(progn                                \
	      (setq byte-compile-error-on-warn t)  \
	      (batch-byte-compile))" electric-operator.el

clean :
	@rm -f *.elc

unit:
	${CASK} exec ert-runner

test: build unit
	./test.sh

install:
	${CASK} install

.PHONY:	all test install clean build
