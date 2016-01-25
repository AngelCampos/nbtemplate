library(knitr)

build <- function(a) {
  
  # fall back on '/' if baseurl is not specified
  baseurl <- servr:::jekyll_config('.', 'baseurl', '/')
  knitr::opts_knit$set(base.url = baseurl)
  
  # fall back on 'kramdown' if markdown engine is not specified
  markdown <- servr:::jekyll_config('.', 'markdown', 'kramdown')
  
  # see if we need to use the Jekyll render in knitr
  if (markdown == 'kramdown') {
    knitr::render_jekyll()
  } else knitr::render_markdown()
  
  d <- gsub('^_|[.][a-zA-Z]+$', '', a[1])
  ## Default to png since svgs with lots of points can be huge and also choke pandoc
  ## Cache in an underscored dir since we never want to commit cache
  ## figures in a usable path, though excluded in _config.yml since we embed as data_uris
  knitr::opts_chunk$set(
    root.dir   = "../..",
    fig.path   = sprintf('img/%s/', d),
    cache.path = sprintf('_cache/%s/', d),
    cache      = TRUE,
    comment    = NA,
    message    = FALSE,
    warning    = FALSE,
    dev        = "png",
    fig.cap    = "",
    fig.show   = "hold",
    fig.width  = 10,
    fig.height = 8
  )
  
  knitr::opts_knit$set(base.url = paste0(baseurl, "/"), verbose = TRUE, progress = TRUE)
  knitr::opts_knit$set(width = 70)
  knitr::knit(a[1], a[2], quiet = FALSE, encoding = 'UTF-8', envir = .GlobalEnv)
}

local({
  # input/output filenames are passed as two additional arguments to Rscript
  a <- commandArgs(TRUE)
  build(a)
})
