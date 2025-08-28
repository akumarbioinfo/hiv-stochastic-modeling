# Load the functions (assuming they are in the same directory)
source("ssa_step.R")
source("stochastic_simulation.R")
source("multiple_stochastic_simulations.R")
source("calculate_statistics.R")

# Define parameters and initial conditions
parameters <- list(
  l = 0.272,        #  CD4+ T cell production rate
  m = 0.00136,      #  CD4+ T cell death rate
  k1 = 0.00027,     #  Infection rate per virion
  k2 = 0.00027,     #  Infection rate per uninfected CD4+ T cell
  p = 0.1,          #  Proportion of infected cells that are latent
  aL = 0.036,       #  Activation rate of latently infected cells
  al = 0.33,        #  Death rate of actively infected cells
  c = 100,          #  Rate of virion emission by infected CD4+ T cells
  g = 2,            #  Death or clearance rate of virions
  t = 0.2           #  Fraction of activated uninfected CD4+ T cells
)

initial_state <- list(
  T = 200,          # Initial number of activated uninfected CD4+ T cells
  L = 0,            # Initial number of latently infected CD4+ T cells
  I = 0,            # Initial number of actively infected CD4+ T cells
  V = 4e-7          # Initial virion density
)

# Set simulation parameters
num_steps <- 4000     # Adjusted for 40 days, with a time step of dt
dt <- 0.01           # Time step
num_samples <- 10     # Number of simulations

# Run multiple stochastic simulations
all_samples <- multiple_stochastic_simulations(initial_state, parameters, num_steps, dt, num_samples)

# Calculate statistics for virion density (V)
virion_index <- 4  # Index for virion density (V)
virion_statistics <- calculate_statistics(all_samples, virion_index)

# Convert time to days
time_days <- seq(0, (num_steps - 1) * dt, by = dt)

# Plot mean, standard deviation, and coefficient of variation
par(mfrow = c(3, 1))  # Arrange plots in a 3x1 grid
plot(time_days, virion_statistics$means, type = "l", xlab = "Time (days)", ylab = "Mean Virion Density", main = "Mean Virion Density over Time")
plot(time_days, virion_statistics$std_devs, type = "l", xlab = "Time (days)", ylab = "Standard Deviation", main = "Standard Deviation of Virion Density over Time")
plot(time_days, virion_statistics$cv, type = "l", xlab = "Time (days)", ylab = "Coefficient of Variation", main = "Coefficient of Variation of Virion Density over Time")


# Plot all 10 samples of virion density V(t)
plot_title <- "Evolution of HIV-1 Viral Density V(t)"
matplot(time_days, all_samples[, , 4], type = "l", xlab = "Time (days)", ylab = "Virion Density", main = plot_title,
        col = 1:num_samples, lty = 1, lwd = 2,
        legend = paste("Sample", 1:num_samples))

# Plot magnified version of early paths (1 to 3 days)
plot_title_early <- "Early Paths of HIV-1 Viral Density (1 to 3 days)"
matplot(time_days[1:300], all_samples[1:300, , 4], type = "l", xlab = "Time (days)", ylab = "Virion Density", main = plot_title_early,
        col = 1:num_samples, lty = 1, lwd = 2,
        legend = paste("Sample", 1:num_samples))

# Plot trajectories from 8 to 10 days
plot_title_late <- "Trajectories of HIV-1 Viral Density (8 to 10 days)"
matplot(time_days[800:1000], all_samples[800:1000, , 4], type = "l", xlab = "Time (days)", ylab = "Virion Density", main = plot_title_late,
        col = 1:num_samples, lty = 1, lwd = 2,
        legend = paste("Sample", 1:num_samples))