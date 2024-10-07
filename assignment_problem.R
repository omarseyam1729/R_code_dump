library(lpSolve)
cost_matrix<-matrix(c(14,5,8,7,
                       2,12,6,5,
                       7,8,3,9,
                       2,4,6,10),
                      nrow=4,byrow=TRUE)
# Solve the assignment problem
solution <- lp.assign(cost_matrix)

# Get the optimal assignment
assignment <- solution$solution
assignment

# Get the total cost of the optimal assignment
total_cost <- solution$objval
total_cost
