## Additional Notes

Code for those scripts is somehow redundant: all four .R scripts download the data if 
there isn't a local file with it, and delete the data after creating the plots.
This means that the largish file may be downloaded and read four times if one decides to
run all scripts again.

Ideally a single .R script would download and read the data once and create the four plots, but
this would be not in accordance with the request. 

I decided to remove the file at the end of the scripts to avoid updating it to github.

## About the submission

The instructions mentioned that 
''There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo''.

There are more in my repo, that was done in purpose to make the contents clearer for the readers.
In other courses in this specialization there is some emphasis on documentation of what was done -- in particular, 
in some cases a cookbook describing how you got the data and how it was processed is required. 
I guess (my opinion!) that in this case more files that help reviewers/readers to understand what was done are a good thing.