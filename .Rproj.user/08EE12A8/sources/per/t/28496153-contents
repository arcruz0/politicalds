install.packages("devtools")
install.packages("roxygen2")
install.packages("tidyverse")
library(devtools)
library(roxygen2)
library(tidyverse)

# ENGLISH PACKAGE

data_package <- list.files("C:/Users/vicen/Dropbox/Proyecto de libro/libroadp_crc/00-data-package", full.names = T)
View(data_package)

lapply(data_package, load, .GlobalEnv)

use_data(americas_gdp_pc)
use_data(approval)
use_data(approval_wide1)
use_data(approval_wide2)
use_data(cinc_index)
use_data(cosponsorship_arg)
use_data(dem_breakdown)
use_data(direct_democracy)
use_data(edu_age)
use_data(lapop)
use_data(messy_summary)
use_data(mosquito_nets)
use_data(municipal_data)
use_data(poltweets)
use_data(senators_arg)
use_data(treaties)
use_data(us_brazil)
use_data(us_latam)
use_data(welfare)
use_data(brazil_states)

devtools::document()

devtools::load_all() #Lo carga hasta cerrar la sesi?n

data(messy_summary) # Prueba si carga la base

devtools::install() # Lo instala en el repositorio
library(politicalds) # Lo carga hasta cerrar la sesi?n

devtools::install_github("username/politicalds") # Instala en GitHub

------------------------------------------------------------------------------------------------
# ENGLISH PACKAGE V.2

# Cargar archivos

lapply(list.files("data_to_add/", full.names = T), load, .GlobalEnv)

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









