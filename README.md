# hiv-stochastic-modeling
A stochastic model for simulating and analyzing the early dynamics of HIV-1 infection.

# Stochastic Modeling of Early HIV-1 Population Dynamics

This repository contains the code and analysis related to a stochastic model for understanding the dynamics of early HIV-1 infection, as described in the paper "Stochastic Modeling of Early HIV-1 Population Dynamics." This model explores the variability inherent in the infection process and investigates the impact of different parameters on viral load and time to detection.

## Project Overview

This project implements and analyzes a stochastic model to simulate the early stages of HIV-1 infection. The model incorporates key components of the viral life cycle and interactions with the immune system, using stochastic differential equations (SDEs) and the Strong Euler method to capture the inherent randomness in the infection process. Monte Carlo simulations are employed to explore the impact of parameter variations and to analyze the distribution of outcomes.

## Contents

This repository includes:

*   **Code:**
    *   `ssa_step.R`: Implements a single step of the Stochastic Simulation Algorithm (SSA).
    *   `stochastic_simulation.R`: Performs stochastic simulations, using `ssa_step.R`.
    *   `multiple_stochastic_simulations.R`: Runs multiple stochastic simulations and stores the results.
    *   `calculate_statistics.R`: Calculates the mean, standard deviation, and coefficient of variation from the simulation results.
    *   `hiv_model_analysis.R`: The main script for simulating the dynamics of the human immunodeficiency virus (HIV-1) infection in the body, focusing on the interaction between the virus and CD4+ T cells, and generate plots.

*   **Data:**
    *   (If any data files are generated during simulation, add a description of them. For example: )
        *   `parameters.csv`: Contains the parameter values used in the model.
        *   `simulation_results.RData`: Example of the simulated values.

*   **Figures/Plots:**
    *   `figures/`: A directory containing the generated plots and visualizations. The plots include:
        *   Sample paths of T, L, I, and V over time.
        *   Mean, standard deviation, and coefficient of variation of virion density over time.
        *   Evolution of HIV-1 Viral Density V(t) with early path and trajectories.
        *   Plots showing the effects of parameter changes (e.g., decreased/increased 'a', 'c', 'g', 'k', 'm', and 't').
        *   Histograms showing the distribution of time to reach detection thresholds.

## Dependencies

*   R
    *   Packages: `deSolve`, `ggplot2` and any other packages used for plotting and statistical analysis.

## Usage

1.  **Clone the repository:**

    ```bash
    git clone <your_repository_url>
    cd <your_repository_name>
    ```

2.  **Install Dependencies:** (Example. Modify as needed.)

    ```R
    install.packages(c("deSolve", "ggplot2"))
    ```

3.  **Run the main analysis script:** (Adapt the command to your script's name)

    ```R
    Rscript hiv_model_analysis.R
    ```

4.  **Explore the generated figures and data.**

##  Results

*  The model demonstrates a threshold effect in the development of primary infection.
*  Sensitivity analysis was conducted by systematically changing model parameters. Increases in the rate of loss of actively infected CD4+ T cells (a) and the parameter proportional to virion emission (c) led to higher peak virion levels and more rapid growth.
*   Changes in the contact/infection rate of CD4+ T cells (k1) and the fraction of uninfected CD4+ T cells available for infection (t) influenced virion density, with higher values resulting in earlier peaks and less variability.
*   The results suggest that decreasing detection thresholds in HIV-1 testing could impact the time to detect the virus, providing insights into the potential benefits of lower thresholds, particularly in scenarios like blood testing.

## Limitations of the model:

The study, while providing valuable insights into early HIV-1 population dynamics
through a stochastic model, exhibits notable limitations. Specifically, it falls short in
comprehensively investigating the impacts of patient variability and genetic variability
of HIV on the immune system in infected individuals. Also, the omission of certain
influential factors, such as the absence of a lymphoid compartment, raises concerns
about the precision of the model's predictions.

## Future Research:

Future research endeavors could focus on incorporating patient variability and
genetic variability of HIV into the stochastic model. This approach would enhance the
model's accuracy in capturing the complexity and variability of HIV dynamics within
the lymphoid compartment. There is a need for a more comprehensive investigation
into the effects of changes in model components and consideration of random
fluctuations and variability in the system. Exploring the implications of stochastic
modeling for antiretroviral treatment, HIV-1 testing, and early diagnosis, while
carefully considering ethical considerations, could further advance our understanding
of HIV-1 dynamics and improve diagnostic and treatment strategies.

## Acknowledgments

This project is based on the paper "Stochastic Modeling of Early HIV-1 Population Dynamics" (provide the reference if you have it: Tuckwell, H. C., & Corfec, E. L. (1998). A stochastic model for early HIV-1 population dynamics. Journal of Theoretical Biology, 195(4), 451–463. https://doi.org/10.1006/jtbi.1998.0806)
