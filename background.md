---
layout: page
title: Background
permalink: /background/
---

The pervasive transcriptional landscape of eukaryotes continues to grow more complex. As technology advances and we get higher resolution snapshots of what regions of the genome we believe are being actively transcribed we've come to define dozens of new classes of RNAs, each with particular functions and/or characteristics. Many of these RNAs cannot be captured by standard RNA-seq protocols that typically look to measure mRNAs in order to associate global transcriptional changes with phenotypic changes. However, with the recent discovery of the importance of ncRNAs in transcriptional regulation it's become more common to look at more diverse populations of RNA including looking at the total amount of RNA within a cell.

While ncRNAs have now been looked at in model organisms for years it's still relatively new in Plasmodium, the genus of parasites that cause malaria. While there has been extensive transcriptional work done on the parasite looking for signatures of drug sensitivity and resistance, only in the last several years have groups begun to characterize the different types of ncRNAs involved in transcriptional regulation.

In Epp et al. and in Sierra-Miranda et al. they were able to show that ncRNAs play an important role in Plasmodium falciparum; highlighting a link between long non-coding and anti-sense RNA in the regulation of a species specific variant antigen family in falciparum, the var gene family. Secondly, it's been shown in yeast that bidirectional promoters are extremely prevalent and that many of the bidirectionality is complemented by transcription of ncRNAs from a shared promoter. Lastly, there is a notable paucity of classic eukaryotic transcription factors in Plasmodium. Together these conclusions have lead some to believe that transcription of ncRNAs could play an important role in genome wide transcriptional regulation in the parasite.

In two recent papers, Siegel et al. and Broadbent et al. looked to isolate total RNA at several time points during the intra-erythrocytic development cycle of the parasite in order to identify different kinds of ncRNAs, how they're regulated, and if we can correlated their expression to any transcriptional changes we've seen when looking at transcription of mRNAs. Unfortunately, they were unable to find global trends correlating anti-sense to sense transcription indicating the it may operate on a more local level and likely has additional functions aside from simply activating or repressing the transcription of mRNAs.

Traditionally, transcriptional profiling in Plasmodium has looked hard at timing of expression and any differences when looking at different strains, species, drug treatments, etc. This is based on a model of the Plasmodium transcriptome that hints at its relative rigidity. In other words, if certain genes aren't transcribed at the right time the parasite will most likely die. However, it's been difficult to characterize exactly how flexible the transcriptome truly is and why certain transcriptional changes lead to distinct phenotypes while others don't. Traditionally tests of enrichment for genes that are involved are limited to custom analyses and GO enrichment tests.

What hasn't yet been looked at in great detail is combining different sources of data, including the vast amount of transcriptional data available (both microarray and RNA-seq) to look at the changes in network topology; in other words pathways and "transcriptional modules." The Bioconductor ecosystem offers a variety of software packages that incorporate network analyses. In addition there is the well known WGNCA package available through CRAN.

## Aims

I would like to develop an analysis pipeline to analyze the various types of transcriptional data that my lab generates that incorporates more systems level analyses such as those used in transcriptional regulatory networks. There are various ways in which this level of analysis could convey novel insights. Those include integrating microarray or RNA-seq data with ChIP-seq data to understand the transcriptional regulatory network of an uncharacterized transcription factor. Another is in building a transcriptional regulatory network that includes ncRNAs to better understand their role in transcriptional regulation if any.

Two different datasets I can test this methodology on are highlighted below. The reason for two proposals is for the sake of redundancy: if one proposal is significantly more time consuming than another or simply not doable then I will switch to the one that's easier to complete in the time frame we have to complete this project.

### Proposal 1

Currently there are many labs (including my own) looking to characterize a family of very important transcriptional regulators in Plasmodium, the ApiAP2 transcription factors. Since genetic engineering of Plasmodium falciparum cell lines is much more labor intensive than other organisms it's not common to see straightforward knockout studies looking at differential expression for example. Thus it's common to see either studies looking at gene expression or looking at ChIP-seq but not both.

In my first proposal I'd like to reanalyze the results of Yuda et al. They look at one specific protein in particular in Plasmodium berghei (rodent malaria) which has now been called AP2-G2 which we believe is important in sexual differentiation. They provide ChIP-seq data, potential transcriptional targets for this transcription factor, and microarray expression data from a knockout line. My plan is to combine the ChIP-seq data with the microarray data in order to create a gene regulatory network and identify important modules for this transcription factor.

Ideally, by creating a pipeline to better characterize ApiAP2 functionality when looking at ChIP-seq data combined with gene expression data, my lab can use it to perform further studies on ApiAP2 proteins in falciparum and better understand their putative functions moving forward.

The paper can be found below under reference 5.

#### Questions of Interest

1. Does the network analysis reveal the same modules of important genes being regulated by this transcription factor as those listed in the original paper?
2. If not, does the new information align well with the interpretation of the paper?
3. Is there a potential alternative model to the one they suggest in the paper?

### Proposal 2

My second proposal involves using the data from Siegel et al. and/or Broadbent et al. in order to recreate a transcript co-expression network but also including expression data from ncRNAs in order to place them within the network.

These papers can be found below under references 3 and 4, respectively.

#### Questions of Interest

1. Will ncRNAs form their own modules or will they mix in with other mRNAs?
2. What properties do the nodes belonging to ncRNAs have and are they different from other RNAs?
3. Are there any notable links between known regulators such as the ApiAP2 proteins and ncRNAs that we can distinguish from the network topology?
4. Are there notable differences when including and not including strand specific information such as the sense to anti-sense expression ratio?

## Alternatives

Study of molecular pathway evolution looking at regulatory networks? Comparative regulatory network analysis!

## References

1. Epp, C., Li, F., Howitt, C.A., Chookajorn, T., and Deitsch, KW. (2009) Chromatin associated sense and antisense non-coding RNAs are transcribed from the var gene family of virulence genes of the malaria parasite *Plasmodium falciparum*
2. Siera-Miranda, M., Delgadillo, D.M., Mancio-Silva, L., Vargas, M., Villegas-Sepulveda, N., Martinez-Calvillo, S. (2012) Two long non-coding RNAs generated from subtelomeric regions accumulate in a novel perinuclear compartment in *Plasmodium falciparum*
3. Siegel, T.N., Hon, C.C., Zhang, Q., Lopez-Rubio, J.J., Scheidig-Benatar, C., Martins, R.M, Sismeiro, O., Coppée, J.Y., and Scherf A. (2014) Strand-specific RNA-seq reveals widespread and developmentally regulated transcription of natural antisense transcripts in *Plasmodium falciparum*
4. Broadbent, K.M., Broadbent, J.C., Ribacke U., Wirth D., Rinn J.L., and Sabeti P.C. (2015) Strand-specific RNA-sequencing in *Plasmodium falciparum* malaria identifies developmentally regulated long non-coding RNA and circular RNA
5. Yuda M., Iwanaga S., Kaneko I., and Kato T. (2015) Global transcriptional repression: An initial and essential step for *Plasmodium* sexual development
6. Bioconductor, Open Source Software for Bioinformatics http://bioconductor.org/
7. Langfelder P, Horvath S (2008) WGCNA: an R package for weighted correlation network analysis
