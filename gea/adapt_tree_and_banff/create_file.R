library(data.table)
# Molecular input file
Y <- data.table::fread(paste("test", ".raw", sep = ""), na.strings = "NA", header = T)
Y <- Y[, -c(1:6)]
fwrite(Y, paste("test", ".lfmm", sep = ""), col.names = T, row.names = F, sep = "\t", na = "NA")
a <- read.table("adapt_tree_and_banff_gea_metadata_ordered_all_valley_coord.txt", sep = "\t", h = F)
colnames(a) <- c("Name","Transect","Topography","H_Index","PC1","PC2","dataset")
b <- read.table("test.lfmm", h = T)
z <- cbind(a,b)
write.table(file = "final_adapt_tree_banff_gea_input.txt",z, quote = F, row.names=F, col.names=T, sep = "\t")
