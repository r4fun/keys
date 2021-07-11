minify <- function(x) {
  gsub("[[:space:]]+", " ", x)
}

#' @importFrom htmltools tags
#' @importFrom jsonlite toJSON
keys_js <- function(id, keys, global = FALSE) {
  if (global) global <- "Global"
  else global <- ""

  x <- sprintf("$(document).on('shiny:sessioninitialized', function() {
    Mousetrap.bind%s(%s, function(e, combo) {
      Shiny.setInputValue('%s', combo, {priority: 'event'});
    });
  });", global, toJSON(keys), id)

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
