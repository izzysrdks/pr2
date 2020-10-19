
report.html: clean_data/Full_data.csv Rcode/Report.Rmd figs/fig1.png
	Rscript -e "rmarkdown::render('Rcode/Report.Rmd', output_file = '../Reports/report.html')"

#rule for cleaning data
clean_data/Full_data.csv: Rcode/CleanData.R Rcode/LoadPackages.R raw_data/Demographics.csv raw_data/TNFalpha.csv raw_data/Engage.csv
	chmod +x Rcode/CleanData.R && Rcode/CleanData.R

#rule for figure1
figs/fig1.png: Rcode/MakeFig1.R clean_data/Full_data.csv
	chmod +x Rcode/MakeFig1.R && Rcode/MakeFig1.R
