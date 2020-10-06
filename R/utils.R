minify <- function(x) {
  gsub("[[:space:]]+", " ", x)
}

#' @importFrom htmltools tags
#' @importFrom jsonlite toJSON
keys_js <- function(id, keys) {

  x <- sprintf("$(document).on('shiny:sessioninitialized', function() {
    Mousetrap.bind(%s, function(e, combo) {
      Shiny.setInputValue('%s', combo, {priority: 'event'});
    });
  });", toJSON(keys), id)

  tags$head(
    tags$script(
      minify(x)
    )
  )
}

alert_null_session <- function() {
  stop(
    "Could not find a shiny session object.",
    "\n* This usually happens when a {keys} function is called from a context that wasn't set up by a shiny session.",
    call. = FALSE
  )
}
