#' Generic Function to Handle R Requests from RSB JSON Applications
#' 
#' The function extracts relevant information from the JSON string
#' to dispatch to the appropriate R wrapper for that particular
#' application
#' @param jsonString character vector of length one containing the JSON string 
#' @return object of class \code{json} as returned by \code{\link[jsonlite]{toJSON}}
#' @examples examplePath <- system.file("examples", "example.json", package = "RSBJson")
#' exampleCon <- file(description = examplePath, open = "rt")
#' exampleLines <- readLines(exampleCon)
#' close(exampleCon)
#' exampleString <- paste(exampleLines, collapse = "\n")
#' (string <- RSBJsonService(jsonString = exampleString))
#' @importFrom jsonlite fromJSON
#' @export
RSBJsonService <- function(jsonString){
  jsonList <- fromJSON(jsonString)
  RFunction <- jsonList$RFunction # string
  Fparams <- jsonList[names(jsonList) != "RFunction"]
  do.call(RFunction, Fparams)
}
