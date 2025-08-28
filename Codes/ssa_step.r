# Function to perform a single SSA step
ssa_step <- function(state, parameters, dt) {
  # Unpack state variables
  T <- state$T
  L <- state$L
  I <- state$I
  V <- state$V

  # Unpack parameters
  l <- parameters$l
  m <- parameters$m
  k1 <- parameters$k1
  k2 <- parameters$k2
  p <- parameters$p
  aL <- parameters$aL
  al <- parameters$al
  c <- parameters$c
  g <- parameters$g
  tau <- parameters$t


  # Perform stochastic simulation steps
  dB <- rbinom(1, size = 1, prob = p)
  dN <- rnorm(1)

  dT <- (l - m * T - k1 * T * V) * dt - tau * k1 * V * sqrt(dt) * dN #I changed dW
  dL <- (k1 * p * T * V - m * L - aL) * dt + tau * k1 * p * T * V * sqrt(dt) * dB #I changed dW
  dI <- (k1 * (1 - p) * T * V + aL - al * I) * dt - tau * k1 * (1 - p) * T * V * sqrt(dt) * dB #I changed dW
  dV <- (c * I - g * V - k2 * T * V) * dt - tau * k2 * T * V * sqrt(dt) * dN #I changed dW

  # Update state variables
  T <- T + dT
  L <- L + dL
  I <- I + dI
  V <- V + dV

  # Return updated state
  return(list(T = T, L = L, I = I, V = V))
}