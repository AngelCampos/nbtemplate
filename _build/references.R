# Build references.bib

library(knitcitations)
options("citation_format" = "pandoc")

citep("10.1093/nar/gkt256")       # Lubliner_2013

write.bibtex(file = "references.bib")
