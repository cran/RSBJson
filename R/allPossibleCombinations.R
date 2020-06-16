#' Generate All Possible Combinations of m Out of n 
#' @param n n
#' @param m m
#' @return a JSON string with all possible combinations;
#'   object of class \code{json} as returned by \code{\link[jsonlite]{toJSON}}
#' @examples allPossibleCombinations(4, 2)
#' @importFrom utils combn
#' @importFrom jsonlite toJSON
#' @export
allPossibleCombinations <- function(n, m){
  combs <- t(combn(x = n, m = m))
  toJSON(combs)
}
