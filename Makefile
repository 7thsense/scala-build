.PHONY: default
default:
	docker build .

publish: default
	docker build -t 7thsense/scala-build:latest .
	docker push 7thsense/scala-build:latest
