onos_url := http://localhost:8181/onos
onos_curl := curl --fail -sSL --user onos:rocks --noproxy localhost

pull:
	docker login registry.gitlab.com --username sonaproject --password sonaakstp
	docker-compose pull

start-local:
	docker-compose up -d

stop-local:
	docker-compose down -t0

restart-local:
	stop-local start-local

log-local:
	docker-compose logs -f edgestack

start:
	sudo systemctl start docker-compose@edgestack

stop:
	sudo systemctl stop docker-compose@edgestack

restart:
	sudo systemctl restart docker-compose@edgestack

status:
	sudo systemctl status docker-compose@edgestack

cli:
	ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -p 8101 karaf@localhost

log:
	cd /opt/docker-compose/edgestack && docker-compose logs -f edgestack

exec:
	docker exec -it edgestack_edgestack_1 bash

load:
ifdef FILE
	sudo docker load -i $(FILE)
else
	echo "EdgeStack image file is not specified!"
endif

update: pull restart

update-offline: 
ifdef FILE
	sudo docker load -i $(FILE)
	sudo systemctl stop docker-compose@edgestack
	sudo systemctl start docker-compose@edgestack
else
	echo "EdgeStack image file is not specified!"
endif

install:
	systemd/install.sh
	sudo mkdir -p /opt/docker-compose/edgestack
	sudo cp -R * /opt/docker-compose/edgestack
	sudo systemctl enable docker-compose@edgestack

uninstall:
	sudo systemctl stop docker-compose@edgestack
	sudo rm -rf /etc/systemd/system/docker-compose@.service
	sudo rm -rf /opt/docker-compose/edgestack
