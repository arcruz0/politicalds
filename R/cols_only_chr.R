#' Indicates columns to load in readr::read_*, from a character vector.
#'
#' This function indicates columns to load in readr::read_*.
#'
#' @param x Character vector of column names
#' @return A call to readr::cols_only()

#' @examples
#' read_csv(readr_example("mtcars.csv"), col_types = cols_only_chr(c("mpg", "cyl")))

#' @export
cols_only_chr <- function(x){
  if (is.character(x) == T) {
    res_list <- vector(mode = "list", length = length(x))
    for (i in 1:length(x)){
      res_list[[i]] <- "?"
    }
    names(res_list) <- x
    do.call(cols_only, res_list)
  } else {
    stop("The vector must be of type 'character'")
  }
}
