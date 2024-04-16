.PHONY: all purge

all:
	@echo USER=$(USER) > docker/env
	@echo UID=$(shell id -u $(USER)) >> docker/env
	@echo GID=$(shell id -g $(USER)) >> docker/env
	./dock-run.sh ./build.sh  '$(TARGET)'

purge:
	cd connectedhomeip && rm -rf out
	@echo Done
