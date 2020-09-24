#' Query the OWLBOT API see <https://owlbot.info/>
#' 
#' @param word a word to be defined.
#' @param x an object of class `rob_def`.
#' @param ... ignored. 
#'
#' @export
#' @examples 
#' \dontrun{
#'  rowlbot("owl")
#' }
rowlbot <- function(word) {
    out <- rob_res(rob_url(word))
    class(out) <- "rob_def"
    out
}

#' @describeIn rowlbot print method for `rob_def` object.
#' @export
print.rob_def <- function(x, ...) {    
    prn <- ifelse(is.null(x$pronunciation), "",
        style_italic("/", x$pronunciation, "/"))

    cat_rule(paste(x$word, prn), col = "blue")
    
    cli_ol()
    for (i in seq_along(x$definitions)) {
        def <- x$definitions[[i]]
        ex <- paste0("ex: \"", def$example, "\"")
        cli_li(def$type)
        ulid <- cli_ul()
        cli_li(cli::col_green(def$definition))
        cli_li(ex)
        if (!is.null(def$emoji)) {
            cli_li(paste0("emoji: ", def$emoji))
        }
        if (!is.null(def$image_url)) {
            cli_li("image available use `plot()`")
        } 
        cli_end(ulid)
    }
    cli_end()
    invisible(NULL)
}

#' @describeIn rowlbot plot method for `rob_def` object.
#' @export
plot.rob_def <- function(x, ...) {
    out <- image_read(x$definitions[[1]]$image_url)
    plot(out)
    invisible(out)
}