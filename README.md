# Scientific readability project

## NB: I renamed ScrapeLinks_and_Text.py sclat.py


## NB: I renamed TextAnalysis_v3.py t_analysis.py 

The original versions of the files have been deleted from the most current branch, although they still are accessible on this website, by viewing 'parent commits'


Python chromium/geckodriver configuration is here:
https://github.com/russelljjarvis/SReadability/blob/dev/Dockerfile#L34-L111


Instructions for running code on your end. In the terminal navigate to to the Sreadability directory. Type 

```git pull origin master``` and enter GH credentials.

Then use wcp alias. (ie type `wcp` in the terminal). If that does not work you may need to remember to type ```source ~/.profile``` if you have not yet run `cat ~/.bashrc >> ~/.bash_profile `

and then 
type ```wcp``` until the prompt says 'jovyan' then you are in the container (fast command line virtual machine).
Then inside container run ```ipython -i ScrapeLinksandText_v5.py``` and then ```ipython -i tAnalysis.py```
Or I can do it on your computer when you are free next.

To install octave (MATLAB by FOSS), use the command inside docker container:
```sudo bash install_octave.sh```

To run both Scrape_links_and_text_etc.py and tAnalysis.py

Run:

``` ipython -i run_all.py ```
