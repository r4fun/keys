minify <- function(x) {
  gsub("[[:space:]]+", " ", x)
}

keys_js <- function(id, keys) {
  binds <- sprintf(
    "Mousetrap.bind('%s', function() {
      Shiny.setInputValue('%s', '%s', {priority: 'event'});
    });", keys, id, keys
  )

  x <- sprintf("$(document).on('shiny:sessioninitialized', function() {
    %s
  });", paste(binds, collapse = "\n"))

  htmltools::tags$head(htmltools::tags$script(minify(x)))
}
