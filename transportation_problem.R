# Load the lpSolve package
library(lpSolve)

# Define the cost matrix
costs <- matrix(c(8,6,10,9,9,12,13,7,14,9,16,5), nrow = 3, byrow = TRUE)

# Define supply and demand
supply <- c(72,50,78)
demand <- c(45,70,30,55)

# Solve the transportation problem
solution <- lp.transport(costs, "min", row.signs = rep("<=", length(supply)),
                         row.rhs = supply, col.signs = rep(">=", length(demand)),
                         col.rhs = demand)

# Extract the solution and the minimum cost
optimal_plan <- solution$solution
min_cost <- solution$objval

# Print the optimal transportation plan and minimum cost
print(optimal_plan)
print(min_cost)
