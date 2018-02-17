
TIME		:= $(shell date +"%Y-%m-%d %H:%M:%S")
PURPLE 		:= $(shell tput -Txterm setaf 129)
GRAY  		:= $(shell tput setaf 245)
GREEN  		:= $(shell tput -Txterm setaf 4)
BLUE 		:= $(shell tput setaf 25)
YELLOW 		:= $(shell tput setaf 3)
WHITE  		:= $(shell tput setaf 7)
RESET  		:= $(shell tput sgr0)

list: list_deployments list_pods list_services list_ingress


get_resources:

	@echo $(GREEN)
	@kubectl get pod -o wide --all-namespaces

	@echo $(YELLOW)
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
