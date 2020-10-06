#' @importFrom htmltools htmlDependency
html_dependency_mousetrap <- function() {
  htmltools::htmlDependency(
    name = "mousetrap",
    version = "1.6.5",
    package = "keys",
    src = c(
      file = "mousetrap",
      href = "https://unpkg.com/mousetrap@1.6.5"
    ),
    script = "mousetrap.min.js"
  )
}

#' @importFrom utils packageVersion
#' @importFrom htmltools htmlDependency
html_dependency_keys <- function() {
  htmlDependency(
    name = "keys",
    version = packageVersion("keys"),
    src = system.file("js", package = "keys"),
    script = "handlers.js",
  )
}

