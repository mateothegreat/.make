
## Update submodule(s) to HEAD from origin
git/update:

	# @git submodule update --remote
	# git submodule foreach --recursive git checkout master

	REV := $(shell git rev-parse --abbrev-ref HEAD)

	git submodule foreach 'git fetch origin; git checkout $(REV); git reset --hard origin/$(REV); git submodule update --recursive; git clean -dfx'