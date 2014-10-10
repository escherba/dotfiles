.PHONY: setup setup_home

SOURCES = $(shell find home -maxdepth 1 -type f)

setup: setup_home

setup_home: $(SOURCES)
	cp $? ~/
