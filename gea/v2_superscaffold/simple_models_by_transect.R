### NO PC1, but interactions
#### Same as above, but data.table

lmp <- function (modelobject) {
    if (class(modelobject) != "lm") stop("Not an object of class 'lm' ")
    f <- summary(modelobject)$fstatistic
    p <- pf(f[1],f[2],f[3],lower.tail=F)
    attributes(p) <- NULL
    return(p)
}


library(lmtest)
library(data.table)

# Load data using fread
my_data <- fread("final_gea_input.txt", sep = "\t", header = TRUE)

# Obtain the number of columns
num_columns <- ncol(my_data)

# Split data by Transect
transect_groups <- split(my_data, my_data$Transect)

# Loop through transect groups
for (transect_name in names(transect_groups)) {
  
  transect_data <- transect_groups[[transect_name]]
  
  results <- data.frame()
  coefficient_results <- data.frame()
  model_pvals <- data.frame()
  models <- list()
  
  # Loop through columns
  for (i in 22:num_columns) {
    
    # Fit the model
    my_model <- lm(transect_data[[i]] ~ Topography * H_Index, data = transect_data)
    my_model_summary <- summary(my_model)
    
    my_null <- lm(transect_data[[i]] ~ H_Index, data = transect_data)
    my_null_summary <- summary(my_null)
    
    # Significance based on likelihood ratio test
    ratio_test <- lrtest(my_null, my_model)
    p_value <- ratio_test$`Pr(>Chisq)`[2]
    SNP <- colnames(transect_data)[i]
    line <- cbind(SNP, p_value)
    results <- rbind(results, line)
    
    # Save all model coefficients, just in case
    models[[SNP]] <- my_model_summary$coefficients
    
    # Extracting p-values for Topography coefficients and interactions involving topography and taking the minimum
    p_values_coeff <- my_model_summary$coefficients[c(2:3), 4]
    line <- cbind(SNP, min(p_values_coeff))
    coefficient_results <- rbind(coefficient_results, line)
    model_p <- lmp(my_model)
    line_2 <- cbind(SNP,model_p)
    model_pvals <- rbind(model_pvals, line_2)
  }
  
  # Naming the columns of coefficient_results
  colnames(coefficient_results) <- c("SNP", "coeff_p_value")
  colnames(model_pvals) <- c("SNP", "p_value")
  
  # Save models
  saveRDS(models, file = paste0("models_", transect_name, ".rds"))
  
  # Save results
  saveRDS(results, file = paste0("likelihood_ratio_results_", transect_name, ".rds"))
  
  # Save coefficient_results
  saveRDS(coefficient_results, file = paste0("coefficient_results_", transect_name, ".rds"))
  
  saveRDS(model_pvals, file = paste0("model_pval_results_", transect_name, ".rds"))
}

