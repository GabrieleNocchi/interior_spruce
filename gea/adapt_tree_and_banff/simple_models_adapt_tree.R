library(lmtest)
library(data.table)

################# Adapt Tree #################

my_data <- fread("final_adapt_tree_banff_gea_input.txt", sep = "\t", header = TRUE)

# Obtain the number of columns
num_columns <- ncol(my_data)
my_data <- my_data[my_data$dataset == "adapt_tree",]

# set up outputs
results <- data.frame()
models <- list()

# Loop through columns
for (i in 8:num_columns) {
  
  # Fit the model
  my_model <- lm(my_data[[i]] ~ PC2, data = my_data)
  my_model_summary <- summary(my_model)
  
  my_null <- lm(my_data[[i]] ~ 1, data = my_data)
  my_null_summary <- summary(my_null)
  
  # Significance based on likelihood ratio test
  ratio_test <- lrtest(my_null, my_model)
  p_value <- ratio_test$`Pr(>Chisq)`[2]
  SNP <- colnames(my_data)[i]
  line <- cbind(SNP, p_value)
  results <- rbind(results, line)
  
  # Save all model coefficients, just in case
  models[[SNP]] <- my_model_summary$coefficients
 
}

# Save models
saveRDS(models, file = "adapt_tree_models_PC2.rds")
saveRDS(results, file = "adapt_tree_likelihood_ratio_results_PC2.rds")


################# Adapt Tree 2 #################

my_data <- fread("final_adapt_tree_banff_gea_input.txt", sep = "\t", header = TRUE)

# Obtain the number of columns
num_columns <- ncol(my_data)
my_data <- my_data[my_data$dataset == "adapt_tree",]

# set up outputs
results <- data.frame()
models <- list()

# Loop through columns
for (i in 8:num_columns) {
  
  # Fit the model
  my_model <- lm(my_data[[i]] ~ PC1, data = my_data)
  my_model_summary <- summary(my_model)
  
  my_null <- lm(my_data[[i]] ~ 1, data = my_data)
  my_null_summary <- summary(my_null)
  
  # Significance based on likelihood ratio test
  ratio_test <- lrtest(my_null, my_model)
  p_value <- ratio_test$`Pr(>Chisq)`[2]
  SNP <- colnames(my_data)[i]
  line <- cbind(SNP, p_value)
  results <- rbind(results, line)
  
  # Save all model coefficients, just in case
  models[[SNP]] <- my_model_summary$coefficients
 
}

# Save models
saveRDS(models, file = "adapt_tree_models_PC1.rds")
saveRDS(results, file = "adapt_tree_likelihood_ratio_results_PC1.rds")




################# Banff #################
my_data <- fread("final_adapt_tree_banff_gea_input.txt", sep = "\t", header = TRUE)

# Obtain the number of columns
num_columns <- ncol(my_data)
my_data <- my_data[my_data$dataset == "banff",]

# set up outputs
results <- data.frame()
models <- list()

# Loop through columns
for (i in 8:num_columns) {
  
  # Fit the model
  my_model <- lm(my_data[[i]] ~ Topography * H_Index, data = my_data)
  my_model_summary <- summary(my_model)
  
  my_null <- lm(my_data[[i]] ~ H_Index, data = my_data)
  my_null_summary <- summary(my_null)
  
  # Significance based on likelihood ratio test
  ratio_test <- lrtest(my_null, my_model)
  p_value <- ratio_test$`Pr(>Chisq)`[2]
  SNP <- colnames(my_data)[i]
  line <- cbind(SNP, p_value)
  results <- rbind(results, line)
  
  # Save all model coefficients, just in case
  models[[SNP]] <- my_model_summary$coefficients
  
}

# Save models
saveRDS(models, file = "banff_models.rds")
saveRDS(results, file = "banff_likelihood_ratio_results.rds")





################# Transects #################
my_data <- fread("final_adapt_tree_banff_gea_input.txt", sep = "\t", header = TRUE)

# Obtain the number of columns
num_columns <- ncol(my_data)
my_data <- my_data[my_data$dataset == "banff",]

# Split data by Transect
transect_groups <- split(my_data, my_data$Transect)

# Loop through transect groups
for (transect_name in names(transect_groups)) {
  
  transect_data <- transect_groups[[transect_name]]
  
  results <- data.frame()
  models <- list()
  
  # Loop through columns
  for (i in 8:num_columns) {
    
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
    
  }
  
  # Save models
  saveRDS(models, file = paste0("models_", transect_name, ".rds"))
  saveRDS(results, file = paste0("likelihood_ratio_results_", transect_name, ".rds"))

}
