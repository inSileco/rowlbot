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

rob_res <- function(q_url, token = rob_getsecret(), ...) {
    con <- rob_get(q_url, token, ...)
    # check status
    httr::stop_for_status(con)
    # parsed
    httr::content(con, "parsed", ...)
}

rob_getsecret <- function() {
    val <- Sys.getenv("OWLBOT_TOKEN")
    if (identical(val, "")) {
        message("
            `OWLBOT_TOKEN` env var has not been set yet.
            A token is required to use the OWLBOT API, see
            https://owlbot.info/
        ")
        rob_set_token()
        val <- rob_getsecret()
    }
    val
}

rob_set_token <- function(token = NULL) {
    if (is.null(token))
        token <- readline("Enter your token without quotes: ")
    if (identical(token, "")) {
        stop("No token has been provided.")
    } else {
        Sys.setenv(OWLBOT_TOKEN = token)
        cat("Authentication token stored for the session.\n")
    }
    invisible(NULL)
}

forget_token <- function() Sys.unsetenv("OWLBOT_TOKEN")
