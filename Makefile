.PHONY: deploy deploy_home

SOURCES = $(shell find home -maxdepth 1 -type f)

deploy: deploy_home

deploy_home: $(SOURCES)
	cp $? ~/
