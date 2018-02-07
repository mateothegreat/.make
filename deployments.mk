

deploy: delete_test_echoserver deploy_test_echoserver

deploy_test_echoserver: 

	kubectl apply -f $(SELF_DIR)/test-echoserver.yaml
	$(MAKE) list_services

delete_test_echoserver:

	kubectl delete --ignore-not-found -f $(SELF_DIR)/test-echoserver.yaml
