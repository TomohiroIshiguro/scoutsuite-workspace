help:
	cat Makefile

ss-setup:
	git submodule init
	git submodule update --remote
	cd ScoutSuite/docker && \
	  docker-compose up --build

scout-aws:
	make ss-setup
	rm -Rf output
	docker run --name scoutsuite -it --rm \
	  -v "$(shell pwd)/config/aws/credentials":/root/.aws/credentials:ro \
	  -v "$(shell pwd)/output":/root/scout-report \
		scoutsuite sh -c "/root/scoutsuite/bin/scout aws --no-browser --report-dir /root/scout-report"
