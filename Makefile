
all:
	docker build -t kkoralsky/debian-systemd .

rebuild:
	docker pull debian:stretch
	docker build --no-cache=true -t kkoralsky/debian-systemd .

push:
	docker tag kkoralsky/debian-systemd kkoralsky/debian-systemd:$$(date +%Y%m%d) 
	docker push kkoralsky/debian-systemd

run:
	docker run -d -i -t -v /sys/fs/cgroup:/sys/fs/cgroup:ro dramaturg/debian-systemd
