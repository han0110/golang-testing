# From https://github.com/appleboy/golang-testing/blob/master/Makefile
build:
ifeq ($(tag),)
	@echo "Usage: make $@ tag=<tag>"
	@exit 1
endif
	docker build --no-cache -f Dockerfile$(tag) -t han0110/golang-testing:$(tag) .
