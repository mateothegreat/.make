
## Update submodule(s) to HEAD from origin
git/update:

	git submodule foreach 'git fetch origin; git checkout master; git reset --hard origin/master; git submodule update --recursive; git clean -dfx'