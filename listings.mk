
list: list_deployments list_pods list_services list_ingress

get_resources:

	kubectl get deploy,rs,rc,ingress,svc,pod,cm,secret,pv -o wide --namespace $(NS)

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

