install.packages("devtools")
install.packages("roxygen2")
install.packages("tidyverse")
library(devtools)
library(roxygen2)
library(tidyverse)
library(glue)

devtools::install_github("vmquintero/politicalds") # Instala en GitHub
library(politicalds)

# ENGLISH PACKAGE V.2

# Cargar archivos

lapply(list.files("C:/Users/vicen/Dropbox/Proyecto de libro/paquete_r/bases_ingles_final",
                  full.names = T), load, .GlobalEnv)

list_data <- mget(ls())

# Crear bases para el paquete

dir.create("data")

f_save_data_package <- function(x, name_x){
  save(x, file = glue("data/{name_x}.rda"),
       compress = "bzip2", version = 2)
}

walk2(list_data, names(list_data), f_save_data_package)

data_frames <- Filter(function(x){is.data.frame(get(x))}, ls())

for(d in data_frames) {
  save(list = d, file = glue("data/{d}.rda"),
       compress = "bzip2", version = 2)
}

walk2(list_data, names(list_data), ~ {

})

devtools::document()

# Solución error "Warning: objects 'x', 'x' are created by more than one data call"

check()

rda_files <- dir("C:/Users/vicen/Dropbox/Proyecto de libro/paquete_r/politicalds/data",
                 full.names = TRUE, pattern = ".rda$")

var_names <- lapply(
  rda_files,
  function(rda_files)
  {
    e <- new.env()
    load(rda_files, envir = e)
    ls(e)
  }
)

Reduce(intersect, var_names)



