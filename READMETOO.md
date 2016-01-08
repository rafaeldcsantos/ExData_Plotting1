## Additional Notes

Code for those scripts is somehow redundant: all four .R scripts download the data if 
there isn't a local file with it, and delete the data after creating the plots.
This means that the largish file may be downloaded and read four times if one decides to
run all scripts again.

Ideally a single .R script would download and read the data once and create the four plots, but
this would be not in accordance with the request. 

I decided to remove the file at the end of the scripts to avoid updating it to github.
