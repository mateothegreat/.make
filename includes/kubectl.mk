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
