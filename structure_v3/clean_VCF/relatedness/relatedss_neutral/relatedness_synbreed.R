snp_matrix   <- read.table("matrix.txt")
sample_names <- read.table("names.txt")
sample_names <- sample_names$V1
loci       <- snp_matrix[,1:2]
colnames(loci) <- c("scaffold", "position")
snp_matrix <- snp_matrix[,3:ncol(snp_matrix)]
snp_matrix <- t(snp_matrix)
row.names(snp_matrix) <- sample_names
locinames <- paste (loci$scaffold, loci$position)
colnames(snp_matrix) <- locinames
snp_matrix[snp_matrix== "./."] <- "NA"
snp_matrix[snp_matrix== "0/0"] <- "AA"
snp_matrix[snp_matrix== "0/1"] <- "AB"
snp_matrix[snp_matrix== "1/1"] <- "BB"

library(synbreed)
mydata <- create.gpData(geno = snp_matrix)
rm(snp_matrix)
recoded <- codeGeno(mydata)
K <- kin(recoded, ret = "realized")
save(K, file = "kin.RData")
rm(mydata)

m <- K[,]
write.table(m, "relatedness.txt", row.names = TRUE, col.names = TRUE, quote = FALSE)

