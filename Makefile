build-%:
	MYUID=$(id -u) MYGID=$(id -g) docker-compose -f docker_compose_files/docker-compose-$(*).yml build

run-%:
	MYUID=$(id -u) MYGID=$(id -g) docker-compose -f docker_compose_files/docker-compose-$(*).yml up

down-%:
	docker-compose -f docker_compose_files/docker-compose-$(*).yml down