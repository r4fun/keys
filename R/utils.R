minify <- function(x) {
  gsub("[[:space:]]+", " ", x)
}

keys_js <- function(id, keys) {
  x <- sprintf("$(document).on('shiny:sessioninitialized', function() {
    Mousetrap.bind('%s', function() {
      Shiny.setInputValue('%s', '%s', {priority: 'event'});
    });
  });", keys, id, keys)

  htmltools::tags$head(htmltools::tags$script(minify(x)))
}
