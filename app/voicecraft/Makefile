build:
	docker build -t voicecraft .
build_network:
	docker build -t voicecraft . --network host

run: build
	docker run -d -p 9050:9050/tcp -p 9050:9050/udp --name voicecraft_server voicecraft
run_network: build_network
	docker run -d --network host --name voicecraft_server voicecraft 

remove:
	docker stop voicecraft_server
	docker container rm voicecraft_server

reinstall: remove run
reinstall_network: remove run_network


