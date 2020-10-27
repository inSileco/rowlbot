#' @importFrom graphics plot
#' @importFrom magick image_read
#' @importFrom cli cat_line cat_rule style_italic cli_ol cli_ul cli_end cli_li
#'

rob_baseurl <- function() "https://owlbot.info/api/v4/dictionary/"

rob_url <- function(...) paste0(rob_baseurl(), ...)

rob_get <- function(q_url, token, ...) {
    token <- paste0("Token ", token)
    names(token) <- "Authorization"
    httr::GET(q_url, httr::add_headers(token), ...)
}

rob_res <- function(q_url, token, ...) {
    con <- rob_get(q_url, token, ...)
    # check status
    httr::stop_for_status(con)
    # parsed
    httr::content(con, "parsed")
}

