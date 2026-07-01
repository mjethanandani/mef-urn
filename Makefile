# include setup.mk

.PHONY: draft container push run all

leftover=$(shell docker ps -a -q -f status=exited)
leftover-image=$(shell docker images -a -q)
username=$(USER)
folder=$(notdir $(patsubst %/,%,$(CURDIR)))
image=$(username)/$(folder)

all: container

container:
	-docker rm test
	docker build -t $(image) .; docker run -it --name test \
	--mount type=bind,src="$(PWD)",dst=/app \
	$(image)

debug:
	docker run \
	--mount type=bind,src="$(PWD)",dst=/app \
        -it $(image) bash

tag:
	git push origin --tags

clean:
	-docker rm $$(docker ps -a -q -f status=exited) 2>/dev/null || true
	make -C draft clean
