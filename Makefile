
#rule for final report. In this report, the linear regression is run and the table is made
report.html: clean_data/Full_data.csv Rcode/Report.Rmd figs/fig1.png Rcode/LoadPackages.R install
	Rscript -e "rmarkdown::render('Rcode/Report.Rmd', output_file = '../Reports/report.html')"

#rule for cleaning data
clean_data/Full_data.csv: Rcode/CleanData.R raw_data/Demographics.csv raw_data/TNFalpha.csv raw_data/Engage.csv Rcode/LoadPackages.R install
	chmod +x Rcode/CleanData.R && Rcode/CleanData.R

#rule for figure1
figs/fig1.png: Rcode/MakeFig1.R clean_data/Full_data.csv
	chmod +x Rcode/MakeFig1.R && Rcode/MakeFig1.R

#rule to install any package dependencies
install:
	chmod +x Rcode/InstallPackages.R && Rcode/InstallPackages.R

#rule for help file
help:
	@echo "report.html			: Generate final analysis report. Run regression and get Table 1"
	@echo "clean_data/Full_data.csv	: Merge datasets and only keep necessary columns."
	@echo "figs/fig1.png			: Make Scatter Plot of Engagement and TNF Alpha"
	@echo "InstallPackages			: install package dependencies"