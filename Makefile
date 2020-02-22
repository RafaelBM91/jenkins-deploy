include .env
export  $(shell sed 's/=.*//' .env)

REPOSITORY = ${PWD}/../${NAME_REPOSITORY}/

up:
	docker run \
		--user=root \
		-it \
		--name jenkins-test \
		--rm \
		-e IMAGE_NAME=${IMAGE_NAME} \
		-e IMAGE_VERSION=${IMAGE_VERSION} \
		-e PORTS_CONTAINER=${PORTS_CONTAINER} \
		-v ${PWD}/jenkins-data:/var/jenkins_home \
		-v ${REPOSITORY}:/home \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ${PWD}/Dockerfile:/bucket/Dockerfile \
		-p ${PORT_JENKINS}:8080 \
		-p 50001:50000 \
		jenkinsci/blueocean
