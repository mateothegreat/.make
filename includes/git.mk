
## Update submodule(s) to HEAD from origin
git/update:

	git submodule foreach 'git fetch origin; git checkout master; git reset --hard origin/master; git submodule update --recursive; git clean -dfx'

### Pull submodules to latest commits instead of what repos point to
git/latest:

	git submodule update --init --recursive