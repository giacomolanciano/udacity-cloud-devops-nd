.PHONY: deploy deploy-metrics-server deploy-apache autoscale autoscale-decl load clean clean-apache clean-autoscale clean-autoscale-decl clean-metrics-server

deploy: deploy-metrics-server deploy-apache

deploy-apache:
	kubectl apply -f php-apache.yml

deploy-metrics-server:
	# Edited from https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml
	kubectl apply -f metrics-server-components.yml

autoscale:
	@echo "Warning: the hpa should be started only after metrics-server is up and running. If current cpu % is not shown, run 'make clean-autoscale' and 'make autoscale' again."
	kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10

autoscale-decl:
	@echo "Warning: the hpa should be started only after metrics-server is up and running. If current cpu % is not shown, run 'make clean-autoscale' and 'make autoscale' again."
	kubectl apply -f php-apache-autoscale.yml

load:
	kubectl run --generator=run-pod/v1 -it --rm load-generator --image=busybox /bin/sh -- -c "while true; do wget -q -O- http://php-apache; done"

clean: clean-autoscale clean-apache

clean-apache:
	kubectl delete -f php-apache.yml

clean-autoscale:
	kubectl delete hpa php-apache

clean-autoscale-decl:
	kubectl delete -f php-apache-autoscale.yml

clean-metrics-server:
	kubectl delete -f metrics-server-components.yml
