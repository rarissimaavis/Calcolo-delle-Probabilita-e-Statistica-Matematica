# Number of coin flips
num_flips <- 10

# Vector to store the results
results <- character(num_flips)

# Coin flip simulation
for (i in 1:num_flips) {
  # Generate a random number between 0 and 1
  random_number <- runif(1)
  
  # Assign 'Heads' or 'Tails' based on the random number
  if (random_number < 0.5) {
    results[i] <- 'Heads'
  } else {
    results[i] <- 'Tails'
  }
}

# Count the occurrences of 'Heads' and 'Tails'
counts <- table(results)

# Plotting the results
barplot(counts, main = "Coin Flip Results", xlab = "Outcome", ylab = "Frequency")
