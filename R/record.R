#' Create a keys recorder input control
#'
#' @description Create a key input that can be used to record keys pressed by
#' the user.
#'
#' @param inputId The input slot that will be used to access the value.
#' @export
#' @rdname recordKeys
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
