NAME := millken/nginx-consul-template
VERSION := $(or $(VERSION),$(VERSION),'latest')
PLATFORM := $(shell uname -s)

all: nginx_consul_template

build: all

nginx_consul_template:
	docker build -t $(NAME):$(VERSION) .

release: tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
	@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest

.PHONY: \
	all \
	build \
	nginx_consul_template \
	release \
	tag_latest