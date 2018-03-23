#' @importFrom purrr map_dbl reduce compact
#' @importFrom magrittr %>%
add_semi_colon <- function(pd) {
  is_curly_expr <- is_curly_brace_expr(pd)
  if (is_curly_expr || all(pd$token == "expr")) {
    conditions <- list(
      if (is_curly_expr) which(pd$token != "'}'"),
      if (is_curly_expr) which(styler:::lag(pd$token != "'{'", n = 1)),
      which(pd$lag_newlines > 0L)
    ) %>%
      compact()

    needs_semicolon <- reduce(conditions, intersect,
      .init = which(styler:::lag(pd$token == "expr"))
    )
    if (length(needs_semicolon) < 1L) return(pd)
    semicolumn_pds <- styler:::create_tokens(
      "';'", ";",
      pos_ids = map_dbl(needs_semicolon, styler:::create_pos_ids, pd = pd)
    )
    pd <- styler:::bind_rows(pd, semicolumn_pds) %>%
      styler:::arrange(pos_id)
  }
  pd
}


remove_all_line_breaks <- function(pd) {
  pd$lag_newlines <- 0L
  pd
}

#' @importFrom rlang seq2
remove_all_spaces <- function(pd) {
  reserved <- pd$token %in% c(
    "IF", "ELSE", "FOR", "WHILE", "IN",
    "RIGHT_ASSIGN", "LEFT_ASSIGN", "GT", "LT"
  )
  pd$spaces[(!reserved) & (!styler:::lead(reserved))] <- 0L
  pd
}

remove_comments <- function(pd) {
  is_comment <- pd$token == "COMMENT"
  pd[!is_comment,]
}
