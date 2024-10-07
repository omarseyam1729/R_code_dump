# Load the lpSolve package
library(lpSolve)

# Define the cost matrix
costs <- matrix(c(8,6,10,9,
                  9,12,13,7,
                  14,9,16,5), 
                nrow = 3, 
                byrow = TRUE)

# Define supply and demand
supply <- c(60, 50, 70)    # Total supply = 180
demand <- c(45, 70, 30, 55)  # Total demand = 200

# Add the specific penalty costs for unmet demand
penalty_cost <- c(100, 120, 115, 130)  # Penalty costs for each demand point

# Extend the cost matrix with the dummy row representing the penalty costs
costs_with_dummy <- rbind(costs, penalty_cost)

# Extend the supply vector with the dummy supply to account for unmet demand
supply_with_dummy <- c(supply, sum(demand) - sum(supply))  # Supply shortfall = 20

# Solve the transportation problem with the penalty row
solution <- lp.transport(costs_with_dummy, "min", 
                         row.signs = rep("<=", length(supply_with_dummy)),
                         row.rhs = supply_with_dummy, 
                         col.signs = rep(">=", length(demand)),
                         col.rhs = demand)

# Extract the solution and the minimum cost
optimal_plan <- solution$solution
min_cost <- solution$objval

# Print the optimal transportation plan and minimum cost
print(optimal_plan)
print(min_cost)
