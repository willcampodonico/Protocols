#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=rnaseq-nextflow
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=address@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=6gb
#SBATCH --time=3:00:00        # Will need to adjust time limit for more samples.
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err

pwd; hostname; date
echo "You've requested $SLURM_CPUS_ON_NODE core."

module load singularity/3.1.1

nextflow run nf-core/rnaseq -r 1.4.2 \
-resume \
-profile singularity \
-c nextflow.config \
--reads 'fastq/*{_R1,_R2}.fastq.gz' \
--fasta '/scratch/Shares/rinn/genomes/Homo_sapiens/Gencode/v33/GRCh38.p13.genome.fa' \
--gtf '/scratch/Shares/rinn/genomes/Homo_sapiens/Gencode/v33/gencode.v33.annotation.gtf' \
--fc_group_features_type gene_type \
--pseudo_aligner salmon \
--gencode \
--email address@colorado.edu

date
