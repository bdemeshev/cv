# makefile: Rnw -> tex -> pdf
# v 3.0
# .Rnw extension is automatically added
file_name = demeshev_cv_eng
file_name_2 = demeshev_cv_rus

all: $(file_name).pdf $(file_name_2).pdf

$(file_name).pdf: $(file_name).tex demeshev_eng.bib
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex

	-rm *.aux *.bcf *.fdb_latexmk *.xdv *.out *.fls *.blg *.synctex.gz *.bbl *.run.xml *.out *.log


# $(file_name).tex : $(file_name).Rnw
# 	Rscript -e "library(knitr); knit('$(file_name).Rnw')"

$(file_name_2).pdf: $(file_name_2).tex demeshev_rus.bib
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex $(file_name_2).tex

	# clean auxillary files
	latexmk -c $(file_name_2).tex

	-rm *.aux *.bcf *.fdb_latexmk *.xdv *.out *.fls *.blg *.synctex.gz *.bbl *.run.xml *.out *.log

# $(file_name_2).tex : $(file_name_2).Rnw
# 	Rscript -e "library(knitr); knit('$(file_name_2).Rnw')"


clean:
	-rm $(file_name).pdf
	-rm $(file_name_2).pdf
	-rm *.aux *.bcf *.fdb_latexmk *.xdv *.out *.fls *.blg *.synctex.gz *.bbl *.run.xml *.out *.log
