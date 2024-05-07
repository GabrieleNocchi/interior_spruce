library(data.table)
# Molecular input file
Y <- data.table::fread(paste("test", ".raw", sep = ""), na.strings = "NA", header = T)
Y <- Y[, -c(1:6)]
fwrite(Y, paste("test", ".lfmm", sep = ""), col.names = T, row.names = F, sep = "\t", na = "NA")
a <- read.table("gea_metadata_ordered_all_valley_coord.txt", sep = "\t", h = F)
colnames(a) <- c("Name","ID","Transect","Topography","Elevation","Long","Lat","PPT_At","PPT_Sm","PPT_Sp", "PPT_Wt", "Tmax_At", "Tmax_Sm", "Tmax_Sp","Tmax_Wt","Tmin_At","Tmin_Sm","Tmin_Sp","Tmin_Wt","H_Index")
b <- read.table("test.lfmm", h = T)
c <- read.table("380_pca.eigenvec",  h = T)

z <- cbind(a,c$PC1,b)
colnames(z)[colnames(z) == "c$PC1"] <- "PC1"
write.table(file = "final_gea_input.txt",z, quote = F, row.names=F, col.names=T, sep = "\t")
