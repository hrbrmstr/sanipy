#' Use "Read the Docs" to get help on a Python module/object
#'
#' Uses [utils::browseURL()] to open up a browser window pointing to
#' a <https://docs.python.org> search for the object in question.
#'
#' You pass in the object itself (the function will handle the rest) or
#' a character string with the item to lookup.
#'
#' @md
#' @param obj the unquoted Python object or a character string with the query keyword
#' @param pyver defautls to `3` but you can use any Python version string
#' @param check_keywords logical; if `TRUE` `check_keywords=yes` will be
#'        used in the `docs.python.org` URL
#' @export
#' @examples \dontrun{
#' library(reticulate)
#'
#' mailbox = import("mailbox")
#' readthedocs(mailbox)
#'
#' # or
#'
#' readthedocs("mailbox")
#' }
readthedocs <- function(obj, py_ver=3, check_keywords = TRUE) {

  check_keywords <- if (check_keywords) "yes" else "no"

  query <- if (!is.character(obj)) obj else obj$`__name__`

  browseURL(
    glue::glue(
      "https://docs.python.org/{py_ver}/search.html?q={query}&check_keywords={check_keywords}"
    )
  )
}
