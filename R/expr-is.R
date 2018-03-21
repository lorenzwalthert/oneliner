#' Check whether a parse table corresponds to a certain expression
#'
#' @param pd A parse table.
#' @name pd_is
#' @keywords internal
NULL

#' @describeIn pd_is Checks whether `pd` contains an expression wrapped in
#'   braces.
is_brace_expr <- function(pd, type = c("'('", "'{'", "'['")) {
  if (is.null(pd)) return(FALSE)
  pd$token[1] %in% type
}

#' @describeIn pd_is Checks whether `pd` contains an expression wrapped in
#'   curly brackets.
#' @keywords internal
#' @importFrom purrr partial
is_curly_brace_expr <- partial(is_brace_expr, type = "'{'")


#' @describeIn pd_is Checks whether `pd` contains an expression wrapped in
#'   round brackets.
#'
is_round_brace_expr <- partial(is_brace_expr, type = "'('")
