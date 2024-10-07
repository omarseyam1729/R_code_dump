# Load the lpSolve package
library(lpSolve)

# Define the cost matrix
costs <- matrix(c(7,8,10,9,7,8), 
                nrow = 2, 
                byrow = TRUE)

# Define supply and demand
supply <- c(40,60)    # Total supply = 180
demand <- c(40,30,50)  # Total demand = 200

# Add the specific penalty costs for unmet demand
penalty_cost <- c(20,22,23)  # Penalty costs for each demand point

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
