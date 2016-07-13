
dat.submission <- read.csv("~/data/kaggle/GROPU-BIMBO/sample_submission.csv")
dat.client <- read.csv("~/data/kaggle/GROPU-BIMBO/cliente_tabla.csv")
dat.product <- read.csv("~/data/kaggle/GROPU-BIMBO/producto_tabla.csv")
dat.town <- read.csv("~/data/kaggle/GROPU-BIMBO/town_state.csv")
dat.train <- read.csv("~/data/kaggle/GROPU-BIMBO/train.csv", nrows = 1000)
dat.test <- read.csv("~/data/kaggle/GROPU-BIMBO/test.csv")

library(magrittr)
library(data.table) 
dat.train.all <- fread("~/data/kaggle/GROPU-BIMBO/train.csv",
                       stringsAsFactors=FALSE,
                       colClasses = c("integer","integer","integer",
                                      "integer","integer","integer",
                                      "integer","numeric","integer",
                                      "integer","integer")
                       )# 3GB.....


dat.submission %>% head
dat.submission %>% summary
dat.client %>% head
dat.client %>% summary
dat.product %>% head
dat.product %>% summary
dat.town %>% head
dat.town %>% summary
dat.train %>% head
dat.train %>% summary
dat.test %>% head
dat.test %>% summary

#### https://www.kaggle.com/fabienvs/grupo-bimbo-inventory-demand/notebook-8a62eda039a3b0b944cf/notebooklibrary(scales)
# devtools::install_github("rstats-db/DBI")
# devtools::install_github("hadley/dplyr")
# devtools::install_github("hadley/dtplyr")
library(dtplyr)
library(dplyr)
format(object.size(dat.train.all), units = "Gb")

class(dat.train.all)
dat.train.dt <- tbl_dt(dat.train.all)
class(dat.train.dt)
names(dat.train.dt)
dat.train.dt %>% group_by(Semana) %>% head(1000) %>% arrange(Demanda_uni_equil) 











