update:

	# @git submodule update --remote
	# git submodule foreach --recursive git checkout master

	git submodule foreach 'git fetch origin; git checkout $(git rev-parse --abbrev-ref HEAD); git reset --hard origin/$(git rev-parse --abbrev-ref HEAD); git submodule update --recursive; gitclean -dfx'