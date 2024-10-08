
library(lpSolve)
objective_coeffs <- c(0, 0, -1)  # We minimize -v, so -v is the 3rd variable
constraint_matrix <- matrix(c(
  3, 1, -1,   # 3x1 + 1x2 - v >= 0  (converted from 3x1 + 1x2 >= v)
  2, 4, -1,   # 2x1 + 4x2 - v >= 0  (converted from 2x1 + 4x2 >= v)
  1, 1, 0     # x1 + x2 = 1
), nrow = 3, byrow = TRUE)

rhs <- c(0, 0, 1)

direction <- c(">=", ">=", "=")

solution <- lp("min", objective_coeffs, constraint_matrix, direction, rhs)

solution$solution # The values of x1, x2, and v
solution$objval   # The objective value (minimum v)
