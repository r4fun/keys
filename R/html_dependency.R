#' @importFrom htmltools htmlDependency
html_dependency_mousetrap <- function() {
  htmltools::htmlDependency(
    name = "mousetrap",
    version = "1.6.5",
    src = system.file("mousetrap", package = "keys"),
    script = c(
      "mousetrap.min.js",
      "mousetrap-pause.min.js",
      "mousetrap-record.min.js",
      "mousetrap-global-bind.min.js"
    )
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
