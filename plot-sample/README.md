### This folder contains plot script output
It's just a samples what can be created with the script.

## Usage

1. Gather data with ./parse.sh script as stated.
2. Reformat gathered data with ./results-parse.sh
3. Run ./plotall.sh
4. That's it! You should have 4 fresh PNG graphics laying in the folder.

You might also manually draw countries heatmap with openheatmap.com

## If something goes wrong
Please check the scripts source code, installed dependencies. If nothing helps, please fill me an issue here in github. Thanks.

### Linux Architectures
![Arch](https://github.com/sxiii/distrowatch-scraper/blob/master/plot-sample/arch.png)

### Distros families that linux are often based of
![BasedOn](https://github.com/sxiii/distrowatch-scraper/blob/master/plot-sample/basedon.png)

### Statuses of Linux distros from Distrowatch.com
![Statuses](https://github.com/sxiii/distrowatch-scraper/blob/master/plot-sample/status.png)

### Countries where distros are more often produced
![Contries](https://github.com/sxiii/distrowatch-scraper/blob/master/plot-sample/countries.png)

### Widely used Linux desktop environments
![Desktops](https://github.com/sxiii/distrowatch-scraper/blob/master/plot-sample/desktop.png)

### Interested in having additional information on linux distros?
Please make your own data-gathering script and .plot script (gnuplot); then commit them to this project! 
