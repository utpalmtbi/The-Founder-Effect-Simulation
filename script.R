library(ggplot2)

# Functions
source("path/to/The-Founder-Effect-Simulation/simulateFounderEffect")
source("path/to/The-Founder-Effect-Simulation/plotFounderEffect")

# Run the simulation
results <- simulateFounderEffect(
  original_pop_size = 1000,  # Total individuals in the original population
  freq_A1 = 0.7,            # Frequency of allele A1 in the original population
  founder_pop_size = 10,    # Size of the founding population
  generations = 5           # Number of generations to simulate
)

# Plot the results
plotFounderEffect(results)
