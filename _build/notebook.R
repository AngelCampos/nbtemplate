# for package iver
# TODO: create R package, add comments, create github repo for easy install
# REFERENCE https://github.com/brendan-R/brocks
# REFERENCE https://github.com/yihui/knitr-jekyll

# give credit to brocks
filenamise <- function(x, sep_char = "_", ext = "") {
  paste0(
    gsub(
      paste0(sep_char, "$|^", sep_char), "",
      gsub(
        paste0(sep_char, "+"), sep_char,
        gsub("[[:space:]]|[[:punct:]]", sep_char, tolower(x))
      )
    ),
    ext
  )
}


# give credit to brocks for this function
new_entry <- function(title    = "New entry", 
                      dir      = "new_entry", 
                      skeleton = "_build/skeleton_entry.Rmd") {
  
  # Sanitise the post title
  fname <- filenamise(title, sep_char = "-")
  
  # create post directory, if it doesn't already exist
  fpath <- file.path("_rmd", dir)
  dir.create(fpath, showWarnings = FALSE)
  
  rmd_name <- file.path(fpath, paste0(Sys.Date(), "-", fname, ".Rmd"))
  r_name   <- file.path(fpath, paste0(fname, ".R"))
  
  # make sure the skeleton file exists
  if(!file.exists(skeleton)){
    stop(paste0("File ", skeleton, " does not exist."))
    #skeleton <- system.file("skeleton_entry", package = "")
  }
  
  # write skeleton post to empty file
  post <- readLines(skeleton)
  post[grepl("title: ", post)] <- paste0("title: ", title)
  writeLines(post, rmd_name)
  
  # write out an empty R file as well, in case that's useful
  writeLines(
    c("# This R file accomanies the .Rmd file", paste("#", rmd_name), ""),
    r_name
  )
  
}

new_page <- function(title    = "New page",
                     dir      = "_pages",
                     skeleton = "_build/skeleton_page.Rmd") {
  
  # Sanitise the post title
  fname <- filenamise(title, sep_char = "-")
  
  rmd_name <- file.path(dir, paste0(fname, ".Rmd"))
  r_name   <- file.path(dir, paste0(fname, ".R"))
  
  # make sure the skeleton file exists
  if(!file.exists(skeleton)){
    stop(paste0("File ", skeleton, " does not exist."))
    #skeleton <- system.file("skeleton_entry", package = "")
  }
  
  # write skeleton post to empty file
  post <- readLines(skeleton)
  post[grepl("title: ", post)] <- paste0("title: ", title)
  post[grepl("permalink: ", post)] <- paste0("permalink: ", paste0("/",title,"/"))
  writeLines(post, rmd_name)
  
  # write out an empty R file as well, in case that's useful
  writeLines(
    c("# This R file accomanies the .Rmd file", paste("#", rmd_name), ""),
    r_name
  )
  
}

build_nb <- function(input  = c("_pages", list.dirs("_rmd")), 
                     output = c(".", rep("_posts", length(list.dirs("_rmd")))),
                     script = "_build/build.R") {
  
  # delete _site directory for build
  system("rm -rf _site")
  
  # build site using servr and jekyll
  servr::jekyll(
    input   = input, 
    output  = output, 
    script  = script,
    serve   = FALSE,
    command = "jekyll build --config _config_dev.yml")
  
}

serve_nb <- function() {
  
  cmd = paste("jekyll",  "serve",
             "--host",   "0.0.0.0",
             "--port",   "4000",
             "--config", "_config_dev.yml",
             "--detach",
             "--watch")
  
  system(cmd)
}

kill_nb <- function() {
  
  system("pkill -f jekyll")
  
}

push_nb <- function() {
  
  # This should be used to push
  # a live site to github-pages
  # probably build site locally
  # then push _site directory to
  # github-pages for hosting
  
}

build_refs <- function(script = "_pages/references.R") {
  
  source(script)
  
}