test <- function() {
  if (!grepl("names(res)", .solution, fixed = TRUE)) {
    stop("Are you using the correct method ?")
  }
  
  # This function is defined in the testTemplate
  success("Well done!")
}