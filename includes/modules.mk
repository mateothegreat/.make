MODULES 	:= $(shell find modules -mindepth 1 -maxdepth 1 -type d 2> /dev/null 2> /dev/null | tr '\r\n' ' ')

## Output list of submodules & repositories
dump/submodules: 

	@printf "$(YELLOW)\n%-46s%s\n\n$(BLUE)" "Submodule Name" "Submodule Repository" 
	@for F in $(MODULES); do	printf "%-45s@%s\n" $$F https://github.com/mateothegreat/$$F | sed -e 's/modules\///g' -e 's/ /./g' -e 's/@/ /' -e 's/-/ /'; done
	@printf "\n"