# Distrowatch scraper/crawler (spider)
Download whole distrowatch database with information on each distribution to separate files

![Img](https://imgur.com/kAOI7fU.png)

## Why do you need this
* You like to survey or find information about distributions
* You're writing a diploma or analytical work
* You're curious on stastistics
* You're studying how to write scripts and/or crawlers/scrapers

## Requirements
* Works with ubuntu & arch. Recent version is developed on Arch (Manjaro)
* html2text
* wget
* sed
* grep
* Bash/linux

## How to use the script in 6 steps
0. Install the requirements (arch: `sudo pacman -S html2text wget git`)
1. Clone this repository (`git clone https://github.com/sxiii/distrowatch-scraper`)
2. Enter the cloned folder (`cd distr*`)
3. Make the script executable (`chmod +x parse.sh`)
4. Run it (`./parse.sh`)
5. Review it's console output or file output (files are created in current date folder!)

## How to view the results
They are layed out in $(current.date) directory (if today is 12.12.2012, the directory will be 12.12.2012). Inside this folder you'll find more then 800 files. Most of the files are named ".results" and ".desc". Desc - it's downloaded web pages with full HTML source of distribution description. ".results" is files with sorted results according to the following scheme:

## Results scheme
* "Based On" - name of the distro, that current was based off,
* "Origin" - country of distribution origin,
* "Architecture" - distribution architecture,
* "Desktops" - desktop that distro officially supports,
* "Category" - which are main use-cases for this distribution,
* "Status" - is the distribution active, dormant, discounted, on waiting list or evaluting (statuses according to distrowatch)
* "Description" - the description itself,
* "Website" - official web portal of the distro,
* "Latest version" - latest published version of the distro.

Note: as it's Linux world, you might port any of distributions from supported platform architecture to unsupported (rewrite, recheck and recompile it), you might compile another desktop environment for it. Distributions statuses might be incorrect because information delay or just a human error. So to be sure, just check all fields and know, that this data "is not a diagnosis".


## Future plans
* Make the script output data & generate some fancy infographics after downlading database
* Support of different output formats
* Port the script to support some other distribution websites
* (maybe) get rid of html2text?
* make it work faster (parallelly?)
* make some sort of menu for this script

## Bugs or errors
This script has a little difference in handling the html2text because of difference in these programs in ArchLinux and Ubuntu. ArchLinux does create markdown text from HTML, while Ubuntu creates plain text. That's why you might edit the script or take the older (ubuntu) version to use with debian/ubuntu OS. Pastebin older ubuntu version is here (tho it's not so improved): https://pastebin.com/nnuVAJdJ

If you notice any other bugs, please create an issue.

## Help and development
* You might help to improve this script. Read the "future plan section"
* That's a good idea to implement your own ideas and commit them to this repository
* Contact me on telegram (fakesnowden) for your ideas and knowledge exchange

## Useful links on the topic
* https://distrowatch.com
* https://distrowatch.com/weekly.php?issue=current
* http://futurist.se/gldt/
* https://github.com/FabioLolix/LinuxTimeline
* https://en.wikipedia.org/wiki/Linux_distribution

*may the source be with you.*
