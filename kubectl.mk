MANIFESTS 	:= $(shell find manifests -type f | tr '\r\n' ' ')

install:	; @echo; for F in $(MANIFESTS); do echo -n "[ INSTALLING $$F ]: " | tr 'a-z' 'A-Z' ; envsubst < $$F | kubectl -n $$NS apply -f -; done; echo;
delete:		; @echo; for F in $(MANIFESTS); do echo -n "[ DELETING $$F ]: " | tr 'a-z' 'A-Z' ; envsubst < $$F | kubectl -n $$NS delete --ignore-not-found -f -; done; echo;
get:		; @echo; for F in $(MANIFESTS); do echo "\n[ RETRIEVING $$F ]: \n" | tr 'a-z' 'A-Z' ; envsubst < $$F | kubectl -n $$NS get -f -; done; echo;
describe:	; @echo; for F in $(MANIFESTS); do echo "\n[ DESCRIBING $$F ]: \n" | tr 'a-z' 'A-Z' ; envsubst < $$F | kubectl -n $$NS describe -f -; done; echo;

GREEN  		:= $(shell tput -Txterm setaf 2)
YELLOW 		:= $(shell tput -Txterm setaf 3)
WHITE  		:= $(shell tput -Txterm setaf 7)
RESET  		:= $(shell tput -Txterm sgr0)
help:

	@echo "\nUsage:\n\n  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}\n\nTargets:\n"
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-20s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
	@echo
