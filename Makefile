build-%:
	MYUID=$(id -u) MYGID=$(id -g) docker-compose -f docker_compose_files/docker-compose-$(*).yml build

run-%:
	MYUID=$(id -u) MYGID=$(id -g) docker-compose -f docker_compose_files/docker-compose-$(*).yml up

rund-%:
	MYUID=$(id -u) MYGID=$(id -g) docker-compose -f docker_compose_files/docker-compose-$(*).yml up -d

down-%:
	docker-compose -f docker_compose_files/docker-compose-$(*).yml down

run-all:
	MYUID=$(id -u) MYGID=$(id -g) docker-compose -f docker_compose_files/docker-compose-code.yml \
												 -f docker_compose_files/docker-compose-jupyter.yml \
												 -f docker_compose_files/docker-compose-red.yml \
												 -f docker_compose_files/docker-compose-portainer.yml \
												 -f docker_compose_files/docker-compose-heimdall.yml \
												 up -d

down-all:
	MYUID=$(id -u) MYGID=$(id -g) docker-compose -f docker_compose_files/docker-compose-code.yml \
												 -f docker_compose_files/docker-compose-jupyter.yml \
												 -f docker_compose_files/docker-compose-red.yml \
												 -f docker_compose_files/docker-compose-portainer.yml \
												 -f docker_compose_files/docker-compose-portainer.yml \
												 down
