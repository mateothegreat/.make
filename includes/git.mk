update:

	# @git submodule update --remote
	# git submodule foreach --recursive git checkout master

	git submodule foreach 'git fetch origin; git checkout $(shell git rev-parse --abbrev-ref HEAD); git reset --hard origin/$(shell git rev-parse --abbrev-ref HEAD); git submodule update --recursive; gitclean -dfx'