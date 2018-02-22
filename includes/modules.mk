TIME		:= $(shell date +"%Y-%m-%d_%H%M%S")
export

## Output list of submodules & repositories
dump/submodules: 

	@printf "$(YELLOW)\n%-46s%s\n\n$(BLUE)" "Submodule Name" "Submodule Repository" 
	@for F in $(MODULES); do	printf "%-45s@%s\n" $$F https://github.com/mateothegreat/$$F | sed -e 's/ /./g' -e 's/@/ /' -e 's/-/ /'; done
	@printf "\n