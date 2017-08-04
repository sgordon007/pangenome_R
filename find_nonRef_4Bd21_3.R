library(tidyverse)

# read in the redundant pangenome matrix
# pangenome_redundant = read.table("data/pangenome_matrix_t0.tab.rotated.txt", sep = "\t", header = TRUE, row.names = 1)
pangenome_redundant = read.table("data/pangenome_matrix_t0.tab.rotated.txt", sep = "\t", header = TRUE)

# read in the list of high-confidence pan-genes
highconf_pangenes = read.table("data/high-confidence.nonRef.pangenes.jgiIds.tsv", sep = "\t", header = FALSE)

# head(pangenome_redundant)
# str(pangenome_redundant)
# str(highconf_pangenes)
# str(highconf_pangenes)
# these are the redundant set of Bd213 genes
Bd213_genes = data.frame(pangenome_redundant %>% 
  filter(Bd21.3_r.1.cds.fna.nucl > 0)) 
# head(Bd213_genes)
# View(Bd213_genes)

# read in the list of high confidence pangenes
# we will take all rows of Bd213_genes that have a member of
# the high confidence nonRef pangenes

# header for cluster_id needs changedFiles
colnames(Bd213_genes)[1] <- "cluster_id"

# add header to highconf_pangenes factor list
colnames(highconf_pangenes)[1] <- "cluster_id"

## we want to find rows in the Bd213 frame that have a 
# highconf_pangene cluster id in one of the columns
# we cannot 
Only keep the most common species
Bd213_highconf_nonRefpangenes <- Bd213_genes %>%
  filter(cluster_id %in% highconf_pangenes$cluster_id)


  select(year, sex, weight)

View(pangenome_redundant)
surveys[which(levels(surveys$sex)=="M")]
