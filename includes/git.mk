
## Update submodule(s) to HEAD from origin
git/update:

	git submodule foreach 'git fetch origin; git checkout master; git reset --hard origin/master; git submodule update --recursive; git clean -dfx'

### Pull submodules to latest commits instead of what repos point to
git/latest:

	git submodule update --init --recursive


# 	@printf "%-45s@%s\n" $(@F) https://github.com/mateothegreat/$(@F) | sed -e 's/ /./g' -e 's/@/ /' 
git/add-%: 				; git submodule add -b master git@github.com:mateothegreat/k8-byexamples-$* modules/k8-byexamples-$*; cd modules/k8-byexamples-$* ; git submodule update --init
git/init: 				; @git submodule update --init
git/init-modules: init 	; @for F in $(MODULES); do $(MAKE) init-submodule-$$F; done
git/init-submodule-%:	; @echo $*; if [ -d modules/$*/.make ]; then cd modules/$* && git submodule update --init; else cd modules/$* && git submodule add -b master git@github.com:mateothegreat/.make.git; fi

git/backup: 			; @echo $(TIME); tar -czf ../.backup/modules.$(TIME).tar .
git/clean: 	git/backup	; rm -rf modules/.make; rm -rf modules/*
git/commit: git/backup	; @for F in $(MODULES); do echo "$(YELLOW)/modules/$$F$(BLUE)" && cd $(PWD)/modules/$$F && git add . && git commit -am'$$MESSAGE' && git push origin HEAD:master; done

git/status: 			; git submodule status --recursive

git/fix-tracking: git/backup	;

	@for F in $(MODULES); do echo "$(YELLOW)/modules/$$F$(BLUE)" && cd $(PWD)/modules/$$F && git config -f .gitmodules submodule..make.branch master && git branch -u origin/master master && git checkout master; done

git/.make-up: git/backup

	@for F in $(MODULES); do echo "$(YELLOW)/modules/$$F$(BLUE)" && cd $(PWD)/modules/$$F/.make && git checkout master && cd .. && git add . && git commit -am'bump' && git push; done