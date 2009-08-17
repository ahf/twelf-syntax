DATE = $(shell date +%Y%m%d)

all: twelf-syntax-$(DATE).tar.bz2

clean:
	@echo "Cleaning ..."
	@rm -rf *.tar.bz2 *.tar || true

twelf-syntax-$(DATE).tar.bz2:
	@echo "Generating $@ ..."
	@git archive --prefix=twelf-syntax-$(DATE)/ HEAD | tar --delete twelf-syntax-$(DATE)/.gitignore twelf-syntax-$(DATE)/Makefile | bzip2 -c > $@

upload: twelf-syntax-$(DATE).tar.bz2
	@echo "Uploading $< ..."
	scp $< dev.exherbo.org:public_html/pub/software/releases/twelf-syntax/

.default: all

.phony: clean upload
