rowlbot
=======

[![R build
status](https://github.com/inSileco/rowlbot/workflows/R-CMD-check/badge.svg)](https://github.com/inSileco/rowlbot/actions)
[![codecov](https://codecov.io/gh/inSileco/rowlbot/branch/master/graph/badge.svg?token=YZYJGK1395)](undefined)
![Monitor
API](https://github.com/inSileco/rowlbot/workflows/Monitor%20API/badge.svg)

An R client for the [Owlbot Dictionary API](https://owlbot.info/).

Installation
============

    remotes::install_github("inSileco/rowlbot")

Example
=======

    library(rowlbot)
    ex <- rowlbot("owl")
    ex

    ## ── owl /oul/ ─────────────────────────────────────────────────────────

    ## 1. noun

    ##   ● a nocturnal bird of prey with large eyes, a facial disc, a
    ##     hooked beak, and typically a loud hooting call.

    ##   ● ex: "I love reaching out into that absolute silence, when you
    ##     can hear the owl or the wind."

    ##   ● emoji: 🦉

    ##   ● image available use `plot()`

> ● image available use `plot()`

So let’s plot it!

    plot(ex)

![](README_files/figure-markdown_strict/unnamed-chunk-4-1.png)

What for?
=========

`rowl` was started for fun and turned out to be a good minimal example
to explain how to create a R client for web API.

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of
Conduct](https://docs.ropensci.org/rcites/CONDUCT.html). By
participating in this project you agree to abide by its terms.
