# Rinn Lab RNA-seq Protocol
### Using the [NF-Core RNA-seq](https://nf-co.re/rnaseq) pipeline and DEseq2 to analyze RNA-seq

###### Author: Michael Smallegan
###### Last updated: April 28, 2020


## Introduction

The Rinn Lab does a LOT of RNA-seq. The goal is that everybody regardless of whether they specialize in wet lab or dry lab is able to run their own standard RNA-seq analysis. To that end, this document steps through what is needed to process the raw data from FastQ input files, align the reads, generate counts over genes, run lots of quality control, and run differential expression analysis. An additional goal is that the analyses are reproducible and when published, they're published along with a companion GitHub repository which computes the results from raw data to figures that are used in the paper. 

Of course each dataset has its own special quirks and each question will call for its own artisanal hand-crafted analysis on top of the standard workflow. The computational specialists in the lab are there to help with that and will also help you get started using this protocol. 

In order to maximize reproducibility, ease of use, and adherance to community standards, we use the Nextflow pipeline from [nf-core](https://nf-co.re/). In order to minimize custom software installs and maximize reproducibility we use the [Singularity](https://sylabs.io/docs/) container provided by nf-core which has all of the software needed to run the pipeline (up through the differential expression -- which is in R). This protocol will inform you how to use this pipeline on Fiji, and you're going to want to know your way around Fiji -- and proper cluster etiquette! -- but that is out of the scope of this document. 

This document refers to nf-core/rnaseq v1.4.2. If the version -- or anything else -- needs to updated, email [me](mailto:michael.smallegan@colorado.edu).

There are some pre-requisite skills that will make this pipeline a lot easier. See Michael or Taeyoung for resources to learn these.

*SKILL PREREQS*:

- Git basics (init, add, commit, push)
- Unix basics (cd, mkdir, nano or vim, wget, etc.)
- GitHub basics (creating a repository)
- Basic R skills (load a file, read function documentation, troubleshooting errors, etc.)
- Understanding of RNA-seq protocol & purpose
- Fiji etiquette

*TOOL PREREQS*:

- ssh client/terminal (way of connecting to fiji, ex. Terminal, iTerm2, Putty)
- ftp client (way of transfering files to and from Fiji, ex. Cyberduck, Filezilla)


#### Broadly the workflow consists of three main steps:

1. Map reads and calculate gene counts.
2. Differential expression of the genes across conditions.
3. Downstream analyses such as gene enrichment analysis. [Not covered here -- yet]

We will focus here on steps 1 and 2, since the follow up analyses are usually specialized to the question. 

Okay, let's get started.

# Part 1: Reads to counts

Since this part of the protocol is using the nf-core pipeline, some of this documentation is overlapping with the provided documentation. Their docs are quite good! The reason for including it here is to show you exactly how to use this pipeline on Fiji our compute cluster. If something isn't working, check to see if they have updated their docs. Also, email me to let me know this needs to be updated!

## Installation

### Install [nextflow](https://www.nextflow.io/)

1. ssh into fiji
2. go to your home directory using `cd`
3. If you don't have one already, make a `bin` directory there using `mkdir bin`
4. `cd` into `bin`, then retrieve nextflow using `curl -s https://get.nextflow.io | bash` (this create a file called `nextflow` in the current directory)
5. add the `bin` directory to your path by adding it to your `~/.profile`. To do this, edit `~/.profile` using `nano ~/.profile` or your favorite terminal text editor and add the following line `PATH=$PATH:~/bin`
6. Next time you login you won't need to to this, but for this time you'll want to activate the new PATH by `source ~/.profile`
7. `cd` to your home directory and test nextflow with `nextflow -version`
8. If that works then you're all set! If not, checkout the Nextflow docs or ask someone for help.



### Retrieve reference genome

There are reference files for Mouse and Human in the directory: `/scratch/Shares/rinn/genomes/`
If you need to retrieve other annotations for different a organism, the [Illumina iGenomes](https://support.illumina.com/sequencing/sequencing_software/igenome.html) project provides lots of genomes in an easy format, however the annotations used in these builds are usually out of date. In general for human and mouse we will use the Comprehensive gene annotation [Gencode](https://www.gencodegenes.org/) which should already be in the shared genomes directory.


I'll also give the instructions to download both human and mouse genomes for your information and so that you can update them if there is a new version. This directory structure may seem unncessary, but it really helps keep things organized!

1. `cd` back to `/scratch/Shares/rinn/genomes`
3. `cd` into `Homo_sapiens` if that's the genome you're updating.
4. `cd` into `Gencode` or `mkdir` if you're using another annotation, for ex. `Encode`.
5. `mkdir v3*` and `cd` into it.
6. Download the Comprehensive gene annotation file using `wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_32/gencode.v32.annotation.gtf.gz` (or right-click, copy link address on the website to get the link for the updated version)
7. Unzip this file using `gunzip gencode.v32.annotation.gtf`
8. Download the Genome sequence fasta for ALL regions using `wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_32/GRCh38.p13.genome.fa.gz`
9. `gunzip GRCh38.p13.genome.fa`

Okay, sweet. Then you're done retreiving the reference genomes. 

That's all the install that's needed for part 1. 

## Project setup

The steps here are to create a directory and move your reads there, create a git repository, and create the scripts needed to run the pipeline. 

*PREREQ*: You'll need a GitHub account to proceed. Go sign-up if you don't have one. 


**TODO: This needs to be updated.**

In this project we'll use the example files located in `/rinnlab/rinngrp/mism6893/rinnseq/rnaseq`. They are partial fastqs from the Firre timecourse project and were reduced in size so that this example pipeline would run faster. Of course, usually your reads will be deposited somewhere within `/rinnlab/rinngrp/Taeyoung/RinnLab_RNAseq/RawData`. 

1. We'll be working in `/scratch/Shares/rinn/[your directory]` so the first step is to create a project file there. For the example workflow, we'll call it simply `rnaseq`. So, `mkdir rnaseq` and `cd` into it.
2. Now, let's retrieve the read files. Create a directory called `fastq` with `mkdir fastq` and `cd` into it.
3. Copy the read files from their backed up locatation (remember scratch is not backed up). `cp /rinnlab/rinngrp/mism6893/rinnseq/rnaseq/fastq/* .` You may want to use `screen` if there are a lot of files and the copying will take a long time. 
4. `cd ..` to get back up into the main project directory and then copy over the sample information with `cp /rinnlab/rinngrp/mism6893/rinnseq/rnaseq/sample_sheet.csv .`
5. Okay, now let's create a local git repository with `git init`
6. Then let's make a README.md using nano, `nano README.md` then add the lines `# Example RNA-seq` and `Performed by [your name]` and whatever other pertinent things you can think of. This document will be very important when publishing your analysis. 
7. Let's then add this to the repo and commit it using `git add README.md` and `git commit -m "Initializing the project with a README"`
8. Now add the sample sheet. The purpose of commiting them separately is that you should strive to make each commit change one thing. This makes the git history human readable and helps someone else -- or future you -- understand how your analysis developed. Let's `git add sample_sheet.csv` and `git commit -m "Adding the sample info for the example fastq files"`. 

---

9. Changing gears, we're going to get some GitHub setup out of the way here. You're going to want to use ssh auth for GitHub which makes everything way easier down the road. You won't have to put in your username and password every time. You're goint to add the ssh key that you have on fiji to your GitHub account. You can follow [these instructions](https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account).

Okay, now back to the project setup steps.

---

10. Create new repository on GitHub with the same name as your project directory (in this case `rnaseq`). For pre-publication research, it is best to keep the repository private. Don't initalize the repo with a README, since we already have one!
11. Copy the instructions to push an existing repository from the command line and run them in your terminal. Make sure you're in your main project directory. It will be `git remote add origin git@github.com:[username]/rnaseq.git` and then `git push -u origin master`
12. Then reload the GitHub page and you should see the README.md and sample_sheet.csv!

Okay, sweet. Now we just need to add the script that will actually run the pipeline and the nextflow.config file which let's the pipeline know about our local Fiji environment.

#### Adding slurm script

Okay, so to run the pipeline we'll submit a slurm script that will call nextflow and have it run the pipeline. 


1. Navigate to your project directory `/scratch/Shares/rinn/[your directory]/rnaseq` and copy over the `nextflow.config` file and `run.sh` file from this GitHub directory.
2. The `run.sh` you will have to modify a bit. In particular, use your favorite text editor to change the `youremail@colorado.edu` to your actual email. 

**Other things that may vary:**
- The length of the job will depend on the number of samples you have. To be a good citizen on the cluster and not claim resources that you will not use, it's best to estimate these times as best you can. You can always email bit-help@colorado.edu if it's looking like your job won't complete in your requested time and they can extend the job length. 
- There are also a number of parameters that you can vary including the aligner (STAR or HISAT2). For a full list check out the [running the pipeline](https://nf-co.re/rnaseq/docs/usage) section of the nf-core rnaseq docs.
- The pattern for the reads will likely change between different fastq naming schemes, so you'll have to change that accordingly (i.e. {_read1,read2} vs. {_R1,_R2}).

**Things to double check:**
- You'll want to make sure that the path to the log file in the slurm script exists. If it doesn't your slurm job will fail with no error messages. In this case it does exist because it will write the log file in whatever directory you start the job from.
- Check that your genome annotation and sequence paths match where the reference files exist
- Make sure you've got the right species for your reference genome files!

5. Now let's commit these new files to our git repo and push to the remote repository. First `git add run.sh nextflow.config` then `git commit -m "Adding the slurm script to run nf-core rnaseq"`

Okay, take one last double check and then we're on to the next!

## Running the pipeline

This part is easy! Unless something goes wrong... Then you've got a bit of troubleshooting. You have some resources for that: this document, the nf-core docs. Also be sure to google your errors. There's an art to that! Okay, here goes.

1. Navigate to your project directory and submit the slurm script using `sbatch run.sh`
2. Check on the status of your job in the slurm queue by using `squeue -u [your-username]`. If it's running, that's great! If you check back on this you should see jobs continue to populate. 

** when switching versions, you may have to `nextflow drop nf-core/rnaseq` before running the pipeline which deletes the local copy of the pipeline files.

3. Check on the output of the pipeline using `tail nextflow.out` or follow the updates with `tail -f nextflow.out`. Use `ctrl+c` to quit that.
4. If you're having any issues, also check out the nextflow.err file using `more nextflow.err` or the nextflow.log file.

Okay, if it's running and doesn't error out then you've got some time to get some coffee and read over [information about the output files](https://nf-co.re/rnaseq/docs/output). As you can see, most of what get's outputted is quality control. Luckily it all gets summarized in an html file called multiqc.html 

Also, after this step in the pipeline, you'll have feature counts meaning we can move on to the next stage of this analysis!

You'll need to carefully consider the QC results and decide which samples you can move forward with. One of the most useful diagnostic plots is the multidimensional scaling plot and the sample clustering. Seeing samples within the same experimental condition cluster together is a pretty good validation. You'll also want to see a high proportion of reads aligning to the genome (>85%).  To assess the issues your dataset has, you can search for the problem on this awesome website: [https://sequencing.qcfail.com/](https://sequencing.qcfail.com/). 

# Part 2: Differential expression analysis

For this analysis you'll be using the RStudio server on Fiji. It's worth noting that you could download the counts and annotation data and run this analysis on your local machine, but for convenience we'll keep it on Fiji.

## Setup

1. Navigate to your project directory `cd /scratch/Shares/rinn/[your directory]` and create a new directory called analysis `mkdir analysis`. `cd` into it.
2. Copy the analysis files from this GitHub directory.
3. Make sure you're signed into the VPN or on campus and then open your browser (Chrome reccommended) and go to: [https://fiji-viz.colorado.edu/rstudio/](https://fiji-viz.colorado.edu/rstudio/)
4. Create a new RStudio project, by File -> New Project -> From existing directory. Use your main project directory.
5. There are a number of R packages that we'll need to install. This step will take a while, but you should only need to do it every once in a while when R is upgraded on Fiji. Here are the things you need to install. 

**TODO: sync this list up with what is actually needed**

- `install.packages("BiocManager")`
- `BiocManager::install("DESeq2")`
- `BiocManager::install("DEGreport")`
- `BiocManager::install("rtracklayer")`
- `install.packages("tidyverse")`
- `install.packages("knitr")`

6. Change directory into the `analysis` directory. And set this as the working directory using the RStudio Files window. 
7. Open then `differential_expression.Rmd` script and run through it step by step. Likely the things you will need to modify will be at the beginning of the script. You'll again want to make sure that the file paths point to where you have your reference genomes stored. Of course for your dataset, you will need to change the design and contrasts as well as the DEseq test that's applied (since this example is a timecourse analysis).
8. When you've finished running through the whole script and everything works, just `knit` the document to an html file using the button at the top of the script.
9. Add all your changes to git and push them to the remote repo. Either use the R git GUI window or back in your terminal, you'll want to add and commit `differential_expression.Rmd`, `_util.R`, and `_setup.R`. Don't commit your html file or any intermediate csvs. The purpose of git is to track scripts not data and your scripts should be able reproduce any intermediate data starting from the raw fastq files. 
10. Celebrate!

If you made it through all this, then you have a set of candidate differentially expressed genes to take forward into functional analysis. 
