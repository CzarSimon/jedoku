IMAGE = $(shell appv image)

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)