MANIFESTS 	:= $(shell find manifests -type f | tr '\r\n' ' ')

.PHONY: manifests

## Output manifests detected (used with make install, delete, get, describe, etc)
manifests: ; @echo "MANIFESTS DETECTED: " $(MANIFESTS)

## Installs manifests to kubernetes using kubectl apply (make manifests to see what will be installed)
install:	; @echo; for F in $(MANIFESTS); do echo -n "[ INSTALLING $$F ]: " | tr 'a-z' 'A-Z' ; envsubst < $$F | kubectl -n $$NS apply -f -; done; echo;

## Deletes manifests to kubernetes using kubectl delete (make manifests to see what will be installed)
delete:		; @echo; for F in $(MANIFESTS); do echo -n "[ DELETING $$F ]: " | tr 'a-z' 'A-Z' ; envsubst < $$F | kubectl -n $$NS delete --ignore-not-found -f -; done; echo;

## Retrieves manifests to kubernetes using kubectl get (make manifests to see what will be installed)
get:		; @echo; for F in $(MANIFESTS); do echo "\n[ RETRIEVING $$F ]: \n" | tr 'a-z' 'A-Z' ; envsubst < $$F | kubectl -n $$NS get -f -; done; echo;

## Describes manifests to kubernetes using kubectl describe (make manifests to see what will be installed)
describe:	; @echo; for F in $(MANIFESTS); do echo "\n[ DESCRIBING $$F ]: \n" | tr 'a-z' 'A-Z' ; envsubst < $$F | kubectl -n $$NS describe -f -; done; echo;

## Find first pod and follow log output
logs:       ; kubectl --namespace $(NS) logs -f $(shell kubectl get pods --all-namespaces -lapp=$(APP) -o jsonpath='{.items[0].metadata.name}')

## Globally set the current-context (default namespace)
context:    ; kubectl config set-context $(kubectl config current-context) --namespace=$(NS)

## Grab a shell in a running container
shell:      ; kubectl exec $(shell kubectl get pods --all-namespaces -lapp=$(APP) -o jsonpath='{.items[0].metadata.name}') -it -- /bin/sh
