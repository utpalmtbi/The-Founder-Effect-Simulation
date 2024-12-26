library(ggplot2)

# Function to simulate the founder effect over multiple generations
simulateFounderEffect <- function(original_pop_size = 1000, freq_A1 = 0.7, founder_pop_size = 10, generations = 5) {
  # Generate original population
  original_pop <- sample(c("A1", "A2"), original_pop_size, replace = TRUE, prob = c(freq_A1, 1 - freq_A1))
  original_freq <- table(original_pop) / original_pop_size
  
  # Create founding population
  founder_pop <- sample(original_pop, founder_pop_size)
  founder_freq <- table(founder_pop) / founder_pop_size
  
  # Initialize allele frequencies for the founding population
  A1_freq <- ifelse("A1" %in% names(founder_freq), founder_freq["A1"], 0)
  A2_freq <- ifelse("A2" %in% names(founder_freq), founder_freq["A2"], 0)
  
  # Track allele frequencies over generations
  freqs <- data.frame(
    Generation = 0,
    A1 = A1_freq,
    A2 = A2_freq
  )
  
  current_pop <- founder_pop
  
  for (gen in 1:generations) {
    current_pop <- sample(current_pop, length(current_pop), replace = TRUE)
    current_freq <- table(current_pop) / length(current_pop)
    
    # Update frequencies with 0 if allele is absent
    A1_freq <- ifelse("A1" %in% names(current_freq), current_freq["A1"], 0)
    A2_freq <- ifelse("A2" %in% names(current_freq), current_freq["A2"], 0)
    
    freqs <- rbind(freqs, data.frame(Generation = gen, A1 = A1_freq, A2 = A2_freq))
  }
  
  return(freqs)
}

# Function to plot the founder effect over generations
plotFounderEffect <- function(data) {
  ggplot(data, aes(x = Generation)) +
    geom_line(aes(y = A1, color = "A1")) +
    geom_point(aes(y = A1, color = "A1")) +
    geom_line(aes(y = A2, color = "A2")) +
    geom_point(aes(y = A2, color = "A2")) +
    labs(y = "Frequency", color = "Allele") +
    theme_minimal()
}

# Simulate the founder effect with default parameter values
simulation_result <- simulateFounderEffect()

# Plot the result
plotFounderEffect(simulation_result)

# Print the result table
print(simulation_result)
