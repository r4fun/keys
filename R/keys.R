#' Create a keys input control
#'
#' @description Create a key input that can be used to observe keys pressed by
#' the user.
#'
#' @param inputId The input slot that will be used to access the value.
#' @param keys A character vector of keys to bind. Examples include, `command`,
#' `command+shift+a`, `up down left right`, and more.
#' @param global Should keys work anywhere? If TRUE, keys are triggered when
#' inside a textInput.
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
keysInput <- function(inputId, keys, global = FALSE) {
  htmltools::tagList(
    keys_js(inputId, keys, global)
  )
}
