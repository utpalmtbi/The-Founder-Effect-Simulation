# Load the necessary library
library(ggplot2)

# Source the script
source("path/to/The-Founder-Effect-Simulation/simulation_function.R")
source("path/to/The-Founder-Effect-Simulation/plot_function.R")


# Run the simulation
results <- simulateFounderEffect(
  original_pop_size = 1000,  # Total individuals in the original population
  freq_A1 = 0.7,            # Frequency of allele A1 in the original population
  founder_pop_size = 10,    # Size of the founding population
  generations = 5           # Number of generations to simulate
)

# Plot the results
plotFounderEffect(results)
