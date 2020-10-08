pause_ <- function(
  session,
  fun
){
  if (is.null(session)) alert_null_session()

  session$sendCustomMessage(
    fun,
    TRUE
  )

}

#' Pause or Unpause Keys
#'
#' These functions allow to pause and unpause keyboard watching
#'
#' @inheritParams shiny::updateActionButton
#' @export
#' @rdname pauseKeys
#'
#' @examples
#' if (interactive()){
#' library(shiny)
#' ui <- fluidPage(
#'   useKeys(),
#'   keysInput("keys", letters),
#'   actionButton("pause", "Pause"),
#'   actionButton("unpause", "Unpause")
#' )
#'
#' server <- function(input, output, session) {
#'   observeEvent(input$keys, {
#'     print(input$keys)
#'   })
#'   observeEvent(input$pause, {
#'     pauseKey()
#'   })
#'   observeEvent(input$unpause, {
#'     unpauseKey()
#'   })
#'
#' }
#'
#' shinyApp(ui, server)
#' }
pauseKey <- function(
  session = shiny::getDefaultReactiveDomain()
){
  pause_(session = session, "mousetrap_pause")
}

#' @export
#' @rdname pauseKeys
unpauseKey <- function(
  session = shiny::getDefaultReactiveDomain()
){
  pause_(session = session, "mousetrap_unpause")
}
