.PHONY: check coverage mutants setup tests

check:
	R -e "library(styler)" \
	  -e "resumen <- style_dir('R')" \
	  -e "resumen <- rbind(resumen, style_dir('tests'))" \
	  -e "any(resumen[[2]])" \
	  | grep FALSE

clean:
	rm --force --recursive SeleccionPvvc2022.Rcheck
	rm --force --recursive tests/testthat/_snaps
	rm --force SeleccionPvvc2022_*.tar.gz
	rm --force NAMESPACE

coverage: setup
	Rscript tests/testthat/coverage.R

mutants: tests
	@echo "🙁🏹 No mutation testing on R 👾🎉👾"

setup:
	R -e "devtools::document()" && \
	R CMD build . && \
	R CMD check SeleccionPvvc2022_0.1.0.tar.gz && \
	R CMD INSTALL SeleccionPvvc2022_0.1.0.tar.gz

tests:
	Rscript -e "devtools::test()"
