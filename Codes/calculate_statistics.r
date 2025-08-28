# Function to calculate mean, standard deviation, and coefficient of variation
calculate_statistics <- function(all_samples, variable_index) {
  # Extract the variable samples
  variable_samples <- all_samples[, , variable_index]

  # Calculate the statistics
  means <- apply(variable_samples, 1, mean)
  std_devs <- apply(variable_samples, 1, sd)
  cv <- std_devs / means

  # Return results
  return(list(means = means, std_devs = std_devs, cv = cv))
}