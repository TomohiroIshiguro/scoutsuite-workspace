help:
	cat Makefile

ss-setup:
	# ScoutSuite の最新のコードを取得して、コンテナをビルドする
	git submodule init
	git submodule update --remote
	cd ScoutSuite/docker && \
	  docker-compose up --build

scout-aws:
	# AWS の構成、設定値を検査する
	# ポリシーに ViewOnlyAccess, SecurityAudit を設定した IAM ユーザーの、アクセスキー情報を用いること
	rm -Rf output
	docker run --name scoutsuite -it --rm \
	  -v "$(shell pwd)/config/aws/credentials":/root/.aws/credentials:ro \
	  -v "$(shell pwd)/output":/root/scout-report \
		scoutsuite sh -c "/root/scoutsuite/bin/scout aws --no-browser --report-dir /root/scout-report"
