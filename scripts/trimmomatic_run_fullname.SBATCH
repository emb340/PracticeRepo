#!/bin/bash
#SBATCH --job-name=example
#SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=emb340@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G
#SBATCH --chdir=/home/emb340/net-ID/HW4_slurm

#setting the environment and loading the module
shopt -s expand_aliases
module load trimmomatic

#running trimmomatic on two input fasta files

trimmomatic PE \
/home/emb340/net-ID/HW4_input_files/EC-12_R1_001.fastq.gz \
/home/emb340/net-ID/HW4_input_files/EC-12_R2_001.fastq.gz \
/home/emb340/net-ID/HW4_output_files/EC-12_R1_trmPE.fq.gz /home/emb340/net-ID/HW4_output_files/EC-12_R1_trmSE.fq.gz \
/home/emb340/net-ID/HW4_output_files/EC-12_R2_trmPE.fq.gz /home/emb340/net-ID/HW4_output_files/EC-12_R2_trmSE.fq.gz \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:/home/emb340/net-ID/HW4_input_files/TruSeq3-PE.fa:2:30:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75

#unloading trimmomatic
module unload trimmomatic

