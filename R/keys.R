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

html_dependency_mousetrap <- function() {
  htmltools::htmlDependency(
    name = "mousetrap",
    version = "1.6.5",
    package = "keys",
    src = c(
      file = "mousetrap",
      href = "https://cdnjs.cloudflare.com/ajax/libs/mousetrap/1.6.5"
    ),
    script = "mousetrap.min.js",
  )
}

#' Create a keys input control
#'
#' @description Create a key input that can be used to observe keys pressed by
#' the user.
#'
#' @param inputId The input slot that will be used to access the value.
#' @param keys A character vector of keys to bind. Examples include, `command`,
#' `command+shift+a`, `up down left right`, and more.
#'
#' @examples
#' \dontrun{
#' ui <- fluidPage(
#'   keysInput("keys", c(
#'     "1",
#'     "2",
#'     "3",
#'     "command+shift+k",
#'     "up up down down left right left right b a enter"
#'   )),
#' )
#'
#' server <- function(input, output, session) {
#'   observeEvent(input$keys, {
#'     print(input$keys)
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#'
#' @export
keysInput <- function(inputId, keys) {
  htmltools::tagList(
    lapply(keys, function(x) keys_js(inputId, x)),
    html_dependency_mousetrap()
  )
}
