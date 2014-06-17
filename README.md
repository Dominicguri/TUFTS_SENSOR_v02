Only functions:

1. main.m - sets up initial conditions and starts the simulation by calling ODE45; plots the results
2. mastersim.m - computes all state derivatives [WPI states ; Tufts states]
3. tufts_state_derivs - used by mastersim to compute tufts states derivatives from states, inputs and time
4. tufts_outputs - used by mastersim and main to compute tufts outputs from states, inputs and time
5. wpi_state_derivs - used by mastersim to compute wpi state derivatives from states, input and time
6. wpi_outputs - used by mastersim and main to compute wpi outputs from staets and time
7. wpi_control_law - used by mastersim to generate wpi inputs from tufts outputs, wpi states, and time
