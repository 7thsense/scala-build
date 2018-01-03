.PHONY: default
default:
	docker build -t 7thsense/scala-build:latest .

publish: default
	docker push 7thsense/scala-build:latest
