#' Use built-in `pydoc` to get the Python HTML manual page for a given object
#'
#' You pass in the object itself, **not** a character string.
#'
#' @md
#' @param obj the unquoted Python object
#' @export
#' @examples \dontrun{
#' library(reticulate)
#'
#' mailbox = import("mailbox")
#' py_doc(mailbox)
#' }

py_doc <- function(obj) {

  pydoc <- reticulate::import("pydoc")

  htmltools::html_print(
    htmltools::HTML(
      pydoc$render_doc(obj, renderer = pydoc$HTMLDoc())
    )
  )

}
