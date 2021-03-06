# 
# error-prone.R
# 
# Seungsoo Kim
# February 19, 2018

# directories ----
setwd("/Volumes/shendure-vol8/projects/mutagenesis.3C/nobackup/MAP-C")
dir <- "data"
out <- "figures"

# load libraries ----
library(ggplot2)
library(dplyr)
library(reshape)
library(RColorBrewer)
library(data.table)
library(grid)
library(gplots)
library(scales)
library(permute)
library(gridExtra)
library(stringr)

samps <- c("genomic_1", "genomic_2", "offtarget_1", "offtarget_2", "3C_1", "3C_2", "WT")
brewercols <- brewer.pal(n=6,name="Set1")
paper.font <- theme(text=element_text(size=8),  axis.text=element_text(size=8,color="black"),  legend.text=element_text(size=8))

# mutation count distribution ----
combined <- data.frame()
for (samp in samps) {
  temp <- read.table(paste(dir,"/error-prone_", samp,".mutcounts.txt", sep=""))
  colnames(temp) <- c("muts","total","sub", "del", "ins", "count")
  temp$samp <- factor(samp,levels=samps)
  temp$frac <- temp$count/sum(temp$count)
  temp <- group_by(temp, total, sub, del, ins, samp) %>% summarize(tfrac = sum(frac)) %>% as.data.frame()
  combined <- rbind(combined,temp)
}

# for paper, Figure 1--figure supplement 1D
combined.sub <- subset(combined,samp %in% c("genomic_1", "WT"))
combined.sub$samp <- as.character(combined.sub$samp)
combined.sub[combined.sub$samp=="genomic_1",]$samp <- "Error-prone PCR"
combined.sub$samp <- factor(combined.sub$samp, levels=c("WT","Error-prone PCR"))
combined.sub$indels <- combined.sub$del + combined.sub$ins > 0
combined.sub <- combined.sub %>% group_by(samp,total,indels) %>% select(samp,total,indels,tfrac) %>% summarise(t=sum(tfrac))

cairo_pdf(paste(out,"/mut_counts.pdf", sep=""), 3.4,2)
ggplot(combined.sub) + 
  geom_bar(aes(x=total,y=t,fill=indels), stat="identity", position="stack") + 
  theme_classic() + scale_fill_brewer(palette="Set1", name="Indels", labels=c("0","\u2265 1")) + facet_wrap(~samp,ncol=4,dir="h") + 
  xlab("Mutations") + ylab("Fraction of reads") + 
  theme(strip.background = element_blank(), legend.position=c(0.85,0.5), strip.text=element_text(size=8), legend.key.size = unit(0.3,"cm")) + paper.font
dev.off()

# substitution frequency ----
combined <- data.frame(genotype=character())
for (samp in samps) {
  temp <- read.table(paste(dir,"/error-prone_", samp,".subcounts.txt", sep=""), stringsAsFactors=FALSE, col.names=c("genotype", "count"))
  temp$samp <- samp

  # normalize by all
  temp$frac <- temp$count/subset(temp,genotype=="All")$count
  temp$count <- NULL

  combined <- rbind(combined,temp)
}
combined <- subset(combined, genotype != "WT" & genotype != "All")
combined$sub <- str_sub(combined$genotype,-1,-1)
combined$pos <- as.numeric(str_sub(combined$genotype,1,str_length(combined$genotype)-1))
casted.total <- cast(combined, pos ~ samp, value="frac",  sum)
casted.total$off1 <- casted.total$`offtarget_1`/casted.total$`genomic_1`
casted.total$off2 <- casted.total$`offtarget_2`/casted.total$`genomic_1`
casted.total$off <- (casted.total$off1 + casted.total$off2)/2
casted.total$ratio1 <- casted.total$`3C_1`/casted.total$`genomic_1`
casted.total$ratio2 <- casted.total$`3C_2`/casted.total$`genomic_1`
casted.total$ratio <- (casted.total$ratio1 + casted.total$ratio2)/2

exptstart <- 21
exptend <- 183
exptlen <- 207
offset <- 460

# for paper, Figure 1D
pdf(paste(out,"/error-prone_totalperbase.pdf", sep=""), 5,2.2)
ggplot(subset(casted.total,pos >= exptstart & pos <= exptend)) + 
  geom_hline(aes(yintercept=0)) +
  geom_segment(aes(x=75.5,xend=85.5,y=1.3,yend=1.3)) +
  geom_segment(aes(x=108.5,xend=115.5,y=1.3,yend=1.3)) +
  geom_segment(aes(x=122.5,xend=132.5,y=1.3,yend=1.3)) +
  geom_segment(aes(x=147.5,xend=157.5,y=1.3,yend=1.3)) +
  geom_segment(aes(x=169.5,xend=179.5,y=1.3,yend=1.3)) +
  geom_text(aes(x=80.5,y=2,label='E'), hjust=0.5,size=2.85) +
  geom_text(aes(x=112,y=2,label='F'), hjust=0.5,size=2.85) +
  geom_text(aes(x=127.5,y=2,label='G'), hjust=0.5,size=2.85) +
  geom_text(aes(x=152.5,y=2,label='H'),hjust=0.5,size=2.85) +
  geom_text(aes(x=174.5,y=2,label='I'), hjust=0.5,size=2.85) +
  geom_bar(aes(x=pos, y=log2(ratio), fill=log2(ratio) < -1.1), width=1, stat="identity") + 
  geom_segment(aes(x=pos, xend=pos, y=log2(ratio1), yend=log2(ratio2)), color="black", size=0.2) + 
  theme_classic() + scale_x_continuous(breaks=seq(0,exptlen,25), limits=c(0,exptlen), labels=seq(0,exptlen,25) + offset) + 
  scale_fill_manual(values=c("grey",brewercols[1]),name="") + theme(legend.position="none")+
  scale_y_continuous(limits=c(-3.4,2.3), breaks=seq(-3,2)) + 
  ylab(expression(paste(Log[2]," 3C/Genomic"))) + xlab("Position (bp)") + paper.font
dev.off()

# for paper, Figure 1E
pdf(paste(out,"/error-prone_totalperbase_Leu3.pdf", sep=""), 1.7,1.4)
ggplot(subset(casted.total,pos >= exptstart & pos <= exptend)) + 
  geom_hline(aes(yintercept=0)) +
  geom_bar(aes(x=pos, y=log2(ratio), fill=log2(ratio) < -1.1), width=1, stat="identity") + 
  geom_segment(aes(x=pos, xend=pos, y=log2(ratio1), yend=log2(ratio2)), color="black", size=0.2) + 
  theme_classic() + scale_x_continuous(breaks=seq(0,exptlen,5), limits=c(75.1,85.9), labels=seq(0,exptlen,5) + offset) + 
  scale_y_continuous(limits=c(-3.4,1)) + 
  scale_fill_manual(values=c("grey",brewercols[1]),name="") + theme(legend.position="none")+
  ylab(expression(paste(Log[2]," 3C/Genomic"))) + xlab("Position (bp)") + paper.font
dev.off()

# for paper, Figure 1F
pdf(paste(out,"/error-prone_totalperbase_Sdd4.pdf", sep=""), 1.7,1.4)
ggplot(subset(casted.total,pos >= exptstart & pos <= exptend)) + 
  geom_hline(aes(yintercept=0)) +
  geom_bar(aes(x=pos, y=log2(ratio), fill=log2(ratio) < -1.1), width=1, stat="identity") + 
  geom_segment(aes(x=pos, xend=pos, y=log2(ratio1), yend=log2(ratio2)), color="black", size=0.2) + 
  theme_classic() + scale_x_continuous(breaks=seq(0,exptlen,5), limits=c(107.1,117.9), labels=seq(0,exptlen,5) + offset) + 
  scale_y_continuous(limits=c(-3.4,1)) + 
  scale_fill_manual(values=c("grey",brewercols[1]),name="") + theme(legend.position="none")+
  ylab(expression(paste(Log[2]," 3C/Genomic"))) + xlab("Position (bp)") + paper.font
dev.off()

# for paper, Figure 1G
pdf(paste(out,"/error-prone_totalperbase_Rgt1a.pdf", sep=""), 1.7,1.4)
ggplot(subset(casted.total,pos >= exptstart & pos <= exptend)) + 
  geom_hline(aes(yintercept=0)) +
  geom_bar(aes(x=pos, y=log2(ratio), fill=log2(ratio) < -1.1), width=1, stat="identity") + 
  geom_segment(aes(x=pos, xend=pos, y=log2(ratio1), yend=log2(ratio2)), color="black", size=0.2) + 
  theme_classic() + scale_x_continuous(breaks=seq(0,exptlen,5), limits=c(122.1,132.9), labels=seq(0,exptlen,5) + offset) + 
  scale_y_continuous(limits=c(-3.4,1)) + 
  scale_fill_manual(values=c("grey",brewercols[1]),name="") + theme(legend.position="none")+
  ylab(expression(paste(Log[2]," 3C/Genomic"))) + xlab("Position (bp)") + paper.font
dev.off()

# for paper, Figure 1H
pdf(paste(out,"/error-prone_totalperbase_Rgt1b.pdf", sep=""), 1.7,1.4)
ggplot(subset(casted.total,pos >= exptstart & pos <= exptend)) + 
  geom_hline(aes(yintercept=0)) +
  geom_bar(aes(x=pos, y=log2(ratio), fill=log2(ratio) < -1.1), width=1, stat="identity") + 
  geom_segment(aes(x=pos, xend=pos, y=log2(ratio1), yend=log2(ratio2)), color="black", size=0.2) + 
  theme_classic() + scale_x_continuous(breaks=seq(0,exptlen,5), limits=c(147.1,157.9), labels=seq(0,exptlen,5) + offset) + 
  scale_y_continuous(limits=c(-3.4,1)) + 
  scale_fill_manual(values=c("grey",brewercols[1]),name="") + theme(legend.position="none")+
  ylab(expression(paste(Log[2]," 3C/Genomic"))) + xlab("Position (bp)") + paper.font
dev.off()

# for paper, Figure 1I
pdf(paste(out,"/error-prone_totalperbase_Rgt1c.pdf", sep=""), 1.7,1.4)
ggplot(subset(casted.total,pos >= exptstart & pos <= exptend)) + 
  geom_hline(aes(yintercept=0)) +
  geom_bar(aes(x=pos, y=log2(ratio), fill=log2(ratio) < -1.1), width=1, stat="identity") + 
  geom_segment(aes(x=pos, xend=pos, y=log2(ratio1), yend=log2(ratio2)), color="black", size=0.2) + 
  theme_classic() + scale_x_continuous(breaks=seq(0,exptlen,5), limits=c(169.1,179.9), labels=seq(0,exptlen,5) + offset) + 
  scale_y_continuous(limits=c(-3.4,1)) + 
  scale_fill_manual(values=c("grey",brewercols[1]),name="") + theme(legend.position="none")+
  ylab(expression(paste(Log[2]," 3C/Genomic"))) + xlab("Position (bp)") + paper.font
dev.off()

# for paper, Figure 1--figure supplement 1D
pdf(paste(out,"/error-prone_totalperbase_offtarget.pdf", sep=""), 5,2.2)
ggplot(subset(casted.total,pos >= exptstart & pos <= exptend)) + 
  geom_hline(aes(yintercept=0)) +
  geom_bar(aes(x=pos, y=log2(off)), width=1, fill=brewercols[2], stat="identity") + 
  geom_segment(aes(x=pos, xend=pos, y=log2(off1), yend=log2(off2)), color="black", size=0.2) + 
  theme_classic() + scale_x_continuous(breaks=seq(0,exptlen,25), limits=c(0,exptlen), labels=seq(0,exptlen,25) + offset) + 
  scale_y_continuous(limits=c(-3.4,2.3), breaks=seq(-3,2)) + 
  ylab(expression(paste(Log[2]," 3C/Genomic"))) + xlab("Position (bp)") + paper.font
dev.off()

# for paper, Figure 1--figure supplement 1E
pdf(paste(out,"/error-prone_totalperbase_hist.pdf",sep=""),2,2.2)
ggplot() + geom_histogram(data=casted.total,aes(x=log2(ratio),fill=log2(ratio)< -1.1),binwidth=0.2) + 
  scale_fill_manual(values=c("grey",brewercols[1]),name="") + theme_classic() + 
  theme(legend.position="none") + 
  xlab(expression(paste(Log[2]," 3C/Genomic"))) + ylab("Number of positions") + paper.font
dev.off()
