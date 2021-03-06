
<!-- README.md is generated from README.Rmd. Please edit that file -->

# oneliner

This package builds on [styler](https://github.com/r-lib/styler) by
providing a third-party style guide that can be applied to code with
styler’s code formatters such as `style_text()`.

Let’s see an example

``` r
# remotes::install_github("lorenzwalthert/oneliner")
library(oneliner)
style_text(
  "sum <- function(x, y) {
   x + # hi
   y
  }
  1 + 1",
  style = one_line_style
)
#> sum<-function(x,y){x+y};1+1
```

The name of the style guide is self-explanatory. Put all code on one
line. Advantages of the style guide proposed include:

  - Entirely self-explanatory (probably biggest plus).
  - It ends the tabs / spaces indention war in an unexpected and elegant
    way.
  - You don’t need to worry about EOL markers.
  - You can easily export to csv. One command per column.
  - and so on.

I am sure I have convinced you that this style guide rocks. This is for
real programmers. All code on one line. No spaces or comments. I am
serious. Use this style guide to format your code like nerds do.
