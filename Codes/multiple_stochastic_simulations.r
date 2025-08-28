# Function to perform multiple stochastic simulations
multiple_stochastic_simulations <- function(initial_state, parameters, num_steps, dt, num_samples) {
    # Initialize variables to store simulation results
  all_samples <- array(0, dim = c(num_steps, num_samples, length(initial_state)))
  dimnames(all_samples)[[3]] <- names(initial_state) #Added to make columns readable.

  # Perform multiple stochastic simulations
  for (sample in 1:num_samples) {
    simulation_result <- stochastic_simulation(initial_state, parameters, num_steps, dt)
    all_samples[, sample, ] <- simulation_result
  }

  # Return results
  return(all_samples)
}