# ---------------------------------------------------------------------------
# This makefile compiles a LaTeX altacv resume and provides various quality
# of life options.
#
# Written by Klaire Curde
# ---------------------------------------------------------------------------

sources := kcurde.tex sidebar.tex altacv.cls
output_file := kcurde.pdf
pretty_file := Curde_Klaire_Resume.pdf
pretty_file_dead := Curde_Klaus_Resume.pdf
name1 := KLAIRE
name2 := KLAUS

# Function to replace a string with another across all sources.
replace_name = \
	for file in $(sources) ; do \
		sed -i 's/$(1)/$(2)/g' $$file ; \
	done

## : Compiles all files.
${output_file}: ${sources}
	latexindent -w ${sources}
	#$(word 1,$(sources)) # Accesses only first file
	latexmk -pdf $(word 1,$(sources))

pretty: ## Compiles all files and generates a copy with a pretty name.
	latexindent -w ${sources}
	latexmk -pdf $(word 1,$(sources))
	cp ${output_file} ${pretty_file}

dead: ## Compiles all files and generates a copy with a dead name/change.
	$(call replace_name,name1,name2)
	latexmk -pdf $(word 1,$(sources))
	cp ${output_file} ${pretty_file_dead}
	$(call replace_name,name2,name1)

format: ## Formats all sources with latexmk.
	latexmk -pdf $(word 1,$(sources))

clean: ## Removes all compiled files.
	rm -f ${output_file} ${pretty_file} ${pretty_file_dead}
	rm -f *.bcf *.run.xml *.synctex.gz *.out *.fls *.fdb_latexmk *.log *.blg *.bbl *.aux *.bak?

define help_text
-------------------------------------------------------------------------------
| This makefile compiles a LaTeX altacv resume and provides various quality   |
| of life options including text substitution.                                |
|                                                                             |
| Written by Klaire Curde.                                                    |
-------------------------------------------------------------------------------
endef
export help_text

help:     ## Show this help.
	@echo "$$help_text"
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST) | column -tl 2
