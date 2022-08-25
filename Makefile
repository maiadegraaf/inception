PROJECT = inception

all:
	mkdir -p /home/mgraaf/data/mariadb
	mkdir -p /home/mgraaf/data/wordpress
	docker-compose -f src/docker-compose.yml up --build

stop:
	docker-compose -f src/docker-compose.yml stop

kill:
	docker-compose -f src/docker-compose.yml kill