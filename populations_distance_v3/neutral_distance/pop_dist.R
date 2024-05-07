library(vcfR)
library(adegenet)
library(stats)
library(poppr)



myvcf <- read.vcfR("neutral.vcf")
g_ind <- vcfR2genind(myvcf)
m <- read.table("metadata.txt", sep = "\t")
population_names <- paste(m$V3,m$V4, sep ="_")
g_pop <- genind2genpop(g_ind,pop = as.factor(population_names))
D <- dist.genpop(g_pop)
saveRDS(D, file= "pop_distances.rds")




g_light <- vcfR2genlight(myvcf)
pop(g_light) <- as.factor(population_names)
ploidy(g_light) <- 2
ind.dist <- bitwise.dist(g_light)
saveRDS(ind.dist,file = "ind_distances.rds")
