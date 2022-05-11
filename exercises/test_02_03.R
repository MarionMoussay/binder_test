test <- function() {
  if (!grepl("res <- AovSum(CocoaA~Product+Panelist,data=sensochoc)", .solution, fixed = TRUE)) {
    stop("Are you using the correct method ? Try the same used just before.")
  }
  
  # This function is defined in the testTemplate
  success("Well done!")
}