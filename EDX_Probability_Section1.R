#############################################################
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# EdX - Probability
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*
#############################################################

#
# SECTION 1 - DISCREET PROBABILITY
#

#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# Probability of Cyan -general
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

cyan <- 3
magenta <- 5
yellow <- 7

# Assign a variable `p` as the probability of choosing a cyan ball from the box
p <- 3/15

# Print the variable `p` to the console
p

#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# Probability of Not Cyan -general
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

# `p` is defined as the probability of choosing a cyan ball from a box containing: 3 cyan balls, 5 magenta balls, and 7 yellow balls.
# Using variable `p`, calculate the probability of choosing any ball that is not cyan from the box

1-p

#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# Sampling without replacement - generalized
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

cyan <- 3
magenta <- 5
yellow <- 7

# The variable `p_1` is the probability of choosing a cyan ball from the box on the first draw.
p_1 <- cyan / (cyan + magenta + yellow)

# Assign a variable `p_2` as the probability of not choosing a cyan ball on the second draw without replacement.

p_2 <- ((magenta + yellow)/(cyan + magenta + yellow - 1))

# Calculate the probability that the first draw is cyan and the second draw is not cyan using `p_1` and `p_2`.

p_1*p_2

#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# Sampling With Replacement - generalized
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

cyan <- 3
magenta <- 5
yellow <- 7

# The variable 'p_1' is the probability of choosing a cyan ball from the box on the first draw.
p_1 <- cyan / (cyan + magenta + yellow)

# Assign a variable 'p_2' as the probability of not choosing a cyan ball on the second draw with replacement.

p_2 <- (magenta + yellow)/(cyan + magenta + yellow)

# Calculate the probability that the first draw is cyan and the second draw is not cyan using `p_1` and `p_2`.

p_1 * p_2


#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# Sampling With Replacement
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

cyan <- 3
magenta <- 5
yellow <- 7

# Assign the variable 'p_yellow' as the probability that a yellow ball is drawn from the box.

p_yellow <- yellow/(cyan+magenta+yellow)

# Using the variable 'p_yellow', calculate the probability of drawing a 
#yellow ball on the sixth draw. Print this value to the console.

p_yellow

#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# Rolling a Die
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

# Assign the variable 'p_no6' as the probability of not seeing a 6 on a single roll.

p_no6 <- 5/6

# Calculate the probability of not seeing a 6 on six rolls using `p_no6`. 
#Print your result to the console: do not assign it to a variable.

p_no6^6


#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# Probability Celtics will Win a Game
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

# Assign the variable `p_cavs_win4` as the probability that the Cavs will win 
#the first four games of the series.

p_cavs_win4 <- 0.6^4

# Using the variable `p_cavs_win4`, calculate the probability that the Celtics 
#win at least one game in the first four games of the series.

(1-p_cavs_win4)

#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# Monte Carlo simulation for Celtics winning a game
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

# This line of sample code simulates four independent random games where the 
#Celtics either lose or win. Copy this sample code to use within the `replicate` function.
simulated_games <- sample(c("lose","win"), 4, replace = TRUE, prob = c(0.6, 0.4))

# The variable 'B' specifies the number of times we want the simulation to run. 
#Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result 
#after random sampling.
set.seed(1)

# Create an object called `celtic_wins` that replicates two steps for B iterations: 
#(1) using the sample code to generate a four-game series `simulated_games`, then 
#(2) determining whether the simulated series contains at least one win for the Celtics.

celtic_wins <- replicate(B, {
  simulated_games <- sample(c("lose","win"), 4, replace = TRUE, prob = c(0.6, 0.4))
  any(simulated_games=="win")
})

mean(celtic_wins)

# Calculate the frequency out of B iterations that the Celtics won at least one game. 
#Print your answer to the console.

#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# The Cavs and the Warriors
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

# Assign a variable 'n' as the number of remaining games.
n <- 6

# Assign a variable `outcomes` as a vector of possible game outcomes, where 0 
#indicates a loss and 1 indicates a win for the Cavs.


# Assign a variable `l` to a list of all possible outcomes in all remaining games. 
#Use the `rep` function on `list(outcomes)` to create list of length `n`.

l <- list(0:1)
# Create a data frame named 'possibilities' that contains all combinations of 
#possible outcomes for the remaining games.
possibilities <- expand.grid(rep(l, n))

# Create a vector named 'results' that indicates whether each row in the data 
#frame 'possibilities' contains enough wins for the Cavs to win the series.

results <- rowSums(possibilities)>=4
# Calculate the proportion of 'results' in which the Cavs win the series. 
#Print the outcome to the console.

mean(results)

#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# The Cavs and the Warriors - Monte Carlo
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

# The variable `B` specifies the number of times we want the simulation to run. 
#Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result 
#after random sampling.
set.seed(1)

# Create an object called `results` that replicates for `B` iterations a simulated 
#series and determines whether that series contains at least four wins for the Cavs.
results <- replicate(B, {
  cavs_wins <- sample(c(0,1), 6, replace = TRUE)
  sum(cavs_wins)>=4
})


# Calculate the frequency out of `B` iterations that the Cavs won at least four games 
#in the remainder of the series. Print your answer to the console.

mean(results)

#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# A and B play a series - part 1
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

# Let's assign the variable 'p' as the vector of probabilities that team A will win.
p <- seq(0.5, 0.95, 0.025)

# Given a value 'p', the probability of winning the series for the underdog team 
#B can be computed with the following function based on a Monte Carlo simulation:
prob_win <- function(p){
  B <- 10000
  result <- replicate(B, {
    b_win <- sample(c(1,0), 7, replace = TRUE, prob = c(1-p, p))
    sum(b_win)>=4
  })
  mean(result)
}

# Apply the 'prob_win' function across the vector of probabilities that team A will 
#win to determine the probability that team B will win. Call this object 'Pr'.
Pr <- sapply(p, prob_win)

# Plot the probability 'p' on the x-axis and 'Pr' on the y-axis.

plot(p, Pr)

#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# A and B play a series - part 2
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*

# Given a value 'p', the probability of winning the series for the underdog team B 
#can be computed with the following function based on a Monte Carlo simulation:
prob_win <- function(N, p=0.75){
  B <- 10000
  result <- replicate(B, {
    b_win <- sample(c(1,0), N, replace = TRUE, prob = c(1-p, p))
    sum(b_win)>=(N+1)/2
  })
  mean(result)
}

# Assign the variable 'N' as the vector of series lengths. Use only odd numbers 
#ranging from 1 to 25 games.
N <- seq(1, 25, 2)

# Apply the 'prob_win' function across the vector of series lengths to determine 
#the probability that team B will win. Call this object `Pr`.

Pr<- sapply(N, prob_win)
# Plot the number of games in the series 'N' on the x-axis and 'Pr' on the y-axis.

plot(N, Pr)

