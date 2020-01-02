library(tidyverse)
library(stringr)

mydata = as.tibble(mydata)

my_list <- str_extract_all(mydata$text, "\\b[A-Za-z]*[A-Z]{2,}[A-Za-z]*\\b")
list_len<- length(my_list)
num_acronyms = c()
acronyms = c()
for (i  in 1:list_len){
    if(!identical((my_list[[i]]), character(0))) {acronyms[i] <- str_c(my_list[[i]], collapse = ", " )
                              num_acronyms[i] <- length(my_list[[i]])
  } else{
    num_acronyms[i] <- 0
    acronyms[i] <- "No match"
  }
}
mydata_new <- mutate(mydata, num_acronyms = num_acronyms) %>%
              mutate(acronyms = acronyms)
