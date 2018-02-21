.PHONY: help h
.DEFAULT_GOAL := help

help:


	@echo "${PURPLE}"
	@echo "                                __                 __"
	@echo "   __  ______  ____ ___  ____ _/ /____  ____  ____/ /"
	@echo "  / / / / __ \/ __  __ \/ __  / __/ _ \/ __ \/ __  / "
	@echo " / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /  "
	@echo " \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/   "
	@echo "/____                                                "
	@echo "                       ${BLUE} yomateo.io, it ain't easy.   "
	@echo "${RESET}"
	@echo "Usage: ${YELLOW}make${RESET} ${GREEN}<target(s)>${RESET}"
	@echo
	@echo Targets:
	@echo
	@awk '/^[a-zA-Z\/\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${GREEN}%-20s${RESET} ${GRAY}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
	@echo
	@echo
	@echo Tools:
	@echo
	@awk '/^[a-zA-Z\/\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^### (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${GREEN}%-20s${RESET} ${GRAY}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
	@echo
