#dat <- matrix(c(20,30,10,70), byrow = TRUE, nrow = 2)

### LOAD DATA ---
dat <- read.delim(file.path("data.tsv"), header=TRUE, stringsAsFactors=FALSE, row.names=1)

### SHANNON INDEX DECOMPOSITION ---
source("shannon_index_decomposition.R")
list.sid <- get.ShannonIndexDecomposition(dat)
