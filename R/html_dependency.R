html_dependency_mousetrap <- function() {
  htmltools::htmlDependency(
    name = "mousetrap",
    version = "1.6.5",
    package = "keys",
    src = c(
      file = "mousetrap",
      href = "https://unpkg.com/mousetrap@1.6.5"
    ),
    script = "mousetrap.min.js",
  )
}
