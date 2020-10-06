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
