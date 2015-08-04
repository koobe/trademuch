run-app:
	grails -reloading run-app

run-app-prod:
	grails prod run-app

clean-cache:
	rm -rf data/elasticsearch
