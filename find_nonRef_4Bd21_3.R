library(tidyverse)

# read in the redundant pangenome matrix
pangenome_redundant = read.table("data/pangenome_matrix_t0.tab.rotated.txt", sep = "\t", header = TRUE, row.names = 1)
head(pangenome_redundant)
str(pangenome_redundant)

# these are the redundant set of Bd213 genes
Bd213_genes = pangenome_redundant %>% 
  filter(Bd21.3_r.1.cds.fna.nucl > 0) 

# read in the list of high confidence pangenes
# we will take all rows of Bd213_genes that have a member of
# the high confidence nonRef pangenes
  
  select(year, sex, weight)

View(pangenome_redundant)
surveys[which(levels(surveys$sex)=="M")]
