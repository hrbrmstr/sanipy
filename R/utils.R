#' Default value for an object length being 0
#'
#' The `purrr` package has `%||%` which is super-useful when wanting to
#' infix a default value for an object being `NULL`. This function does
#' the same for `length(x) == 0`.
#'
#' @md
#' @param x,y if `x` has length `0`, will return `y`; otherwise it returns `x`
#' @name zlength-zero-default
#' @export
#' @examples
#' 1 %|0|% 2
#' NULL %|0|% 2
#' character(0) %|0|% 2
`%|0|%` <- function(x, y) { if (length(x) == 0) y else x }
