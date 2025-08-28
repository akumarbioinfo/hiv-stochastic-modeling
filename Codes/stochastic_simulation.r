# Function to perform stochastic simulations
stochastic_simulation <- function(initial_state, parameters, num_steps, dt) {
    # Initialize variables to store simulation results
    state_trajectory <- matrix(0, nrow = num_steps, ncol = length(initial_state))
    colnames(state_trajectory) <- names(initial_state) #Added this to label the columns

    # Set initial state
    current_state <- initial_state

    # Perform stochastic simulation steps
    for (step in 1:num_steps) {
        updated_state <- ssa_step(current_state, parameters, dt)
        state_trajectory[step, ] <- unlist(updated_state)
        current_state <- updated_state
    }

    return(state_trajectory)
}