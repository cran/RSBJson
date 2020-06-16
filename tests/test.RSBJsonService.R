
library(RSBJson)

examplePath <- system.file("examples", "example.json", package = "RSBJson")
exampleCon <- file(description = examplePath, open = "rt")
exampleLines <- readLines(exampleCon)
close(exampleCon)
exampleString <- paste(exampleLines, collapse = "\n")

(string <- RSBJsonService(jsonString = exampleString))
stopifnot(string == "[[1,2],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5],[3,4],[3,5],[4,5]]")
