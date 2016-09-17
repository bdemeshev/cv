# makefile: Rnw -> tex -> pdf
# v 3.0
# .Rnw extension is automatically added
file_name = demeshev_cv_eng
file_name_2 = demeshev_cv_rus

all: $(file_name).pdf $(file_name_2).pdf

$(file_name).pdf: $(file_name).tex
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -pdf $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex

	-rm $(file_name).bbl
	-rm $(file_name).run.xml

# $(file_name).tex : $(file_name).Rnw
# 	Rscript -e "library(knitr); knit('$(file_name).Rnw')"

$(file_name_2).pdf: $(file_name_2).tex
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -pdf $(file_name_2).tex

	# clean auxillary files
	latexmk -c $(file_name_2).tex

	-rm $(file_name_2).bbl
	-rm $(file_name_2).run.xml

# $(file_name_2).tex : $(file_name_2).Rnw
# 	Rscript -e "library(knitr); knit('$(file_name_2).Rnw')"


clean:
	-rm $(file_name).pdf
	-rm $(file_name_2).pdf
	# rm $(file_name).tex
