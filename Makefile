build:
	docker build -t sparkgeo/maptiks-heartbeat_pxy .

rebuild: build
	docker rm -f maptiks-hb-pxy
	make rundev

rundev:
	docker run -d \
	-p 80:80 \
	--name maptiks-hb-pxy sparkgeo/maptiks-heartbeat_pxy

restart:
	docker restart maptiks-hb-pxy

stop:
	docker stop maptiks-hb-pxy

shell:
	docker exec -it maptiks-hb-pxy sh

release:
	eb deploy $(env) --label $(env)_`git rev-parse --verify --short HEAD`_`date +%Y-%m-%d_%H-%M-%S`
