#' Add a key binding from the server side
#'
#' @inheritParams keysInput
#' @inheritParams shiny::updateActionButton
#' @export
#' @rdname updateKeys
addKeys <- function(
  inputId,
  keys,
  session = shiny::getDefaultReactiveDomain()
){
  if (is.null(session)) alert_null_session()

  lapply(
    keys, function(x){
      session$sendCustomMessage(
        "add_mousetrap_binding",
        list(
          id = inputId,
          keys = x
        )
      )
    }
  )

}

#' @export
#' @rdname updateKeys
removeKeys <- function(
  keys,
  session = shiny::getDefaultReactiveDomain()
){
  if (is.null(session)) alert_null_session()

  lapply(
    keys, function(x){
      session$sendCustomMessage(
        "remove_mousetrap_binding",
        list(
          keys = x
        )
      )
    }
  )

}
