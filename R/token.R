#' Get, set and forget authentification token. 
#'
#' @param token authentification token (obtained at <https://owlbot.info/>).
#'
#' @export
rob_get_secret <- function() {
    val <- Sys.getenv("OWLBOT_TOKEN")
    if (identical(val, "")) {
        message("
            `OWLBOT_TOKEN` env var has not been set yet.
            A token is required to use the OWLBOT API, see
            https://owlbot.info/
        ")
        rob_set_token()
        val <- rob_get_secret()
    }
    val
}

#' @describeIn rob_get_secret set token interactively. 
#' @export
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

#' @describeIn rob_get_secret forget token. 
#' @export
forget_token <- function() Sys.unsetenv("OWLBOT_TOKEN")