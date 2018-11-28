all: report.html report_vowels.html

analysis_length: report.html 

analysis_vowels: report_vowels.html

clean:
	rm -f words.txt histogram.tsv histogram.png report.md report.html vowels_word_count.png vowels_word_count.csv report_vowels.md report_vowels.html

report.html: report.rmd histogram.tsv histogram.png
	Rscript -e 'rmarkdown::render("$<")'
	
report_vowels.html: report_vowels.rmd vowels_word_count.csv vowels_word_count.png
	Rscript -e 'rmarkdown::render("$<")'
	
histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

histogram.tsv: histogram.r words.txt
	Rscript $<
	
vowels_word_count.png: vowels_word_count.csv begin_vowels_plot.r
	Rscript begin_vowels_plot.r
	rm Rplots.pdf 
	
vowels_word_count.csv: begin_vowels.r words.txt
	Rscript $<

#words.txt: /usr/share/dict/words
#	cp $< $@

words.txt:
	Rscript -e 'download.file("http://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'
