
<!-- README.md is generated from README.Rmd. Please edit that file -->

keys <img src="man/figures/logo.png" align="right" height=150/>
===============================================================

<!-- badges: start -->

[![R build
status](https://github.com/r4fun/keys/workflows/R-CMD-check/badge.svg)](https://github.com/r4fun/keys/actions)
<!-- badges: end -->

The goal of `{keys}` is to add hotkeys to shiny applications using
[`Mousetrap`](https://github.com/ccampbell/mousetrap). With `{keys}`,
you can:

-   Assign hotkeys on app load
-   Add and remove hotkeys from server
-   Pause and unpause hotkeys from server
-   Record keys from server

A demonstration of the package can be found
[here](https://r4fun.dev/shiny/keys-app/).

Installation
------------

You can install the development version from GitHub with:

    # install.packages("devtools")
    devtools::install_github("r4fun/keys")

Usage
-----

To use `{keys}`, start by adding a dependency to it using `useKeys()`.

Then, you can add a `keysInput` to the UI:

    library(shiny)
    library(keys)

    hotkeys <- c(
      "1", 
      "command+shift+k", 
      "up up down down left right left right b a enter"
    )

    ui <- fluidPage(
      useKeys(),
      keysInput("keys", hotkeys)
    )

    server <- function(input, output, session) {
      observeEvent(input$keys, {
        print(input$keys)
      })
    }

    shinyApp(ui, server)

You can add binding after application launch using `addKeys`.

    library(shiny)
    library(keys)

    ui <- fluidPage(
      useKeys(),
      actionButton("add", "Add keybinding")
    )

    server <- function(input, output, session) {
      observeEvent(input$add, {
        addKeys("keys", c("a", "b", "c"))
      })
      observeEvent(input$keys, {
        print(input$keys)
      })
    }

    shinyApp(ui, server)

Bindings can be removed after application launch using `removeKey`.

    library(shiny)
    library(keys)

    ui <- fluidPage(
      useKeys(),
      keysInput("keys", c("a", "b", "c")),
      actionButton("rm", "Remove `a` keybinding")
    )

    server <- function(input, output, session) {
      observeEvent(input$rm, {
        removeKeys("a")
      })
      observeEvent(input$keys, {
        print(input$keys)
      })
    }

    shinyApp(ui, server)

For more information about what types of hotkeys you can use, please
take a look at the mousetrap github
[repository](https://github.com/ccampbell/mousetrap).

Acknowledgements
----------------

All credit goes to [Craig Campbell](https://github.com/ccampbell) who is
the author of [`Mousetrap`](https://github.com/ccampbell/mousetrap).
