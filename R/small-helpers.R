#' Compactly Display the Structure of a Python object
#'
#' Runs [utils::str()] on the object dictionary
#'
#' @md
#' @param obj the python object
#' @param ... passed to [utils::str()]
#' @export
#' @examples \dontrun{
#' library(reticulate)
#'
#' mailbox = import("mailbox")
#' pystr(mailbox)
#' }
psytr <- function(obj, ...) { str(obj$`__dict__`, ...) } # like 'str()`


#' (All) The Names of a Python Object
#'
#' Running [names()] on a Python object provides the public interface names.
#' This function shows all the hidden names as well
#'
#' @param obj the python object
#' @export
#' @examples \dontrun{
#' library(reticulate)
#'
#' mailbox = import("mailbox")
#' names(mailbox)
#' pynames(mailbox)
#' }
pynames <- function(obj) { reticulate::import_builtins()$dir(obj) } # like 'names()' but more complete

#' Retrieve a value from a Python `dict` as a character
#'
#' It can be cumbersome to deal with all of the `$` in inane Python code.
#' This function lets you specify the object (a Python `dict` or a Python object
#' with a `get()` method) and the key and this will return the value or
#' `NA_character_` if there was no key..
#'
#' @md
#' @param obj Python `dict` or object with a `get()` method
#' @param key the key to retrive the value for
#' @export
get_chr <- function(obj, key) { as.character(.x[["get"]](.y)) %|0|% NA_character_ }

#' Decode a Python structure and retrieve a UTF-8 encoded value from it
#'
#' Calls `obj$decode("utf-8", "ignore")` and returns the value or `NA_character_`
#' if the result is (Python) `None`.
#'
#' @md
#' @param obj Python object
#' @export
utf8_decode <- function(obj) { .x[["decode"]]("utf-8", "ignore") %|0|% NA_character_ }
