# Variables - Override these via command line if necessary (e.g., make build TAG=v2)
DOCKER_USER ?= yourdockerhub_username
IMAGE_NAME ?= ro-mvp-timer
TAG ?= latest

# .PHONY declares these targets as commands, not actual files on the disk
.PHONY: all login build push

# The default target if you just run 'make'
all: login build push

login:
	@echo "Phase 1: Authenticating with Docker Hub..."
	@if [ -z "$$DOCKER_PAT" ]; then \
		echo "Warning: DOCKER_PAT environment variable not set. Falling back to interactive login."; \
		docker login -u $(DOCKER_USER); \
	else \
		echo "Authenticating using provided Personal Access Token..."; \
		echo "$$DOCKER_PAT" | docker login -u $(DOCKER_USER) --password-stdin; \
	fi

build:
	@echo "Phase 2: Building container image..."
	docker build -t $(DOCKER_USER)/$(IMAGE_NAME):$(TAG) .

push:
	@echo "Phase 3: Pushing container image to registry..."
	docker push $(DOCKER_USER)/$(IMAGE_NAME):$(TAG)
