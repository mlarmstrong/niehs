#!/bin/bash -l
#SBATCH --cpus-per-task=24
#SBATCH --mem=40000
#SBATCH -D /home/jajpark/niehs/scripts/
#SBATCH -o /home/jajpark/niehs/slurm-log/star-hetannot-align1-2-stout-%j.txt
#SBATCH -e /home/jajpark/niehs/slurm-log/star-hetannot-align1-2-stderr-%j.txt
#SBATCH -J starhetalign1-2
# modified Mon Sep 26 2016

module load perlnew
module load star

outdir="/home/jajpark/niehs/results/alignments/star_heteroclitus_annot_161116/lanes_1-2"
dir="/home/jajpark/niehs/Data/nebtrim_lanes_1-2"

for sample in `ls /home/jajpark/niehs/Data/nebtrim_lanes_1-2/*R1_001.qc.fq.gz`
do
	
	base=$(basename $sample "_R1_001.qc.fq.gz")
	echo $base
	
	echo `STAR --genomeDir /home/jajpark/niehs/align/star-index-hetannot/ --runThreadN 24 --readFilesCommand zcat --readFilesIn ${dir}/${base}_R1_001.qc.fq.gz ${dir}/${base}_R2_001.qc.fq.gz --outFileNamePrefix $outdir/${base}_`
	
done

