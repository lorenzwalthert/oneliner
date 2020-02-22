version <- unname(read.dcf("DESCRIPTION")[, "Version"])

#' Put all code on one line
#'
#' This is for real programmers. All code on one line. No comments. I am
#' serious. Use this style guide in conjunction with the package styler to
#' format your code like nerds do.
#' @examples
#' style_text(
#'   "sum <- function(x, y) {
#'    x + # hi
#'    y
#'   }
#'   1 + 1",
#'   style = one_line_style
#' )
#' @export
one_line_style <- function() {
  create_style_guide(
    # transformer functions
    initialize        = default_style_guide_attributes,
    line_break        = lst(identity),
    space             = lst(remove_all_spaces),
    token             = lst(remove_comments, add_semi_colon, remove_all_line_breaks),
    indention         = lst(identity),
    # transformer options
    use_raw_indention = TRUE,
    reindention       = tidyverse_reindention(),
    style_guide_name  = "oneliner::one_line_style@https://github.com/lorenzwalthert",
    style_guide_version = version
  )
}
