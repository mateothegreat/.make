
list: list_deployments list_pods list_services list_ingress


get_resources:

	@echo $(YELLOW)
	@kubectl get pod -o wide --all-namespaces

	@echo $(GREEN)
	@kubectl get svc -o wide --all-namespaces

	@echo $(WHITE)
	@kubectl get ing,pvc -o wide --all-namespaces

	@echo $(NORMAL)
	@kubectl get deployment,rs,rc  --all-namespaces

	# kubectl get deploy,rs,rc,ingress,svc,pod,pv,pvc -o wide --all-namespaces

get_myip:

	curl 'https://api.ipify.org'

get_loadbalancer_ip:

	@kubectl --namespace $(NS) get svc -o json | jq '.items[].status.loadBalancer.ingress[]?.ip'

list_deployments:

	@echo ---
	@echo DEPLOYMENTS:
	@echo
	@kubectl --namespace $(NS) get deploy -o wide

list_pods:

	@echo ---
	@echo PODS:
	@echo
	@kubectl --namespace $(NS) get pods -o wide

list_services:

	@echo ---
	@echo SERVICES:
	@echo
	@kubectl --namespace $(NS) get services -o wide

list_ingress:

	@echo ---
	@echo INGRESS:
	@echo
	@kubectl --namespace $(NS) get ingress -o wide