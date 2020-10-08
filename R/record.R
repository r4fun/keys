#' Create a keys recorder input control
#'
#' @description Create a key input that can be used to record keys pressed by
#' the user.
#'
#' @param inputId The input slot that will be used to access the value.
#' @export
#' @rdname recordKeys
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     useKeys(),
#'     keysRecordInput("recorder"),
#'     keysInput("keys", "command+shift+k"),
#'     actionButton("record", "Record keys")
#'   )
#'
#'   server <- function(input, output, session) {
#'     observeEvent(input$record, {
#'       print("recording keys...")
#'       recordKeys("recorder")
#'     })
#'     observeEvent(input$recorder, {
#'       print("adding keys...")
#'       addKeys("keys", input$recorder)
#'     })
#'     observeEvent(input$keys, {
#'       print(input$keys)
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
keysRecordInput <- function(inputId) {
  htmltools::tagList(
    htmltools::tags$input(
      type = "hidden",
      id = inputId
    )
  )
}

#' @inheritParams keysRecordInput
#' @inheritParams shiny::updateActionButton
#' @export
#' @rdname recordKeys
recordKeys <- function(
  inputId,
  session = shiny::getDefaultReactiveDomain()
){
  if (is.null(session)) alert_null_session()

  session$sendCustomMessage(
    "record_mousetrap_binding",
    list(
      id = inputId
    )
  )

}
