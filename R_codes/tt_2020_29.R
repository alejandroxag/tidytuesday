# Tidytuesday - Week 29
# Topic: Austronauts!
# Author: Alejandro Álvarez

##### libraries #####

# Tools' installing tool
if (!'pacman' %in% installed.packages()) install.packages('pacman')

# Packages broadly used in the script
pacman::p_load(tidyverse)

# Packages not broadly used in the script
map(c('tidytuesdayR','here','scriptName'),
    ~pacman::p_install(., force = FALSE, character.only = TRUE))

##### Data #####

# Tidytuesday date
tt <- list(date = map(set_names(unlist(str_split(str_extract(scriptName::current_filename(),
                                                             '(?<=tt_).+(?=.R)'),'_')),
                                c('year','week')),
                      as.integer))

# tt data
tt$data <- tidytuesdayR::tt_load(tt$date$year, week = tt$date$week)

# data
astronauts <- tt$data$astronauts
