#' Use Keys in your application
#'
#' This function adds the {keys} dependencies to your application
#'
#' @return An html singleton
#' @export
#'
#' @importFrom htmltools singleton tagList
useKeys <- function(){
  singleton(
    tagList(
      html_dependency_mousetrap(),
      html_dependency_keys()
    )
  )
}
