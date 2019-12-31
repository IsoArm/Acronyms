library(tidyverse)
library(stringr)

mydata = tibble(
  text = c("ARA vonC EM, qezanic zzvUM", "hh fgr rrr, grt")
  )
my_list <- str_extract_all(mydata$text, "\\b[A-Za-z]*[A-Z]{2,}[A-Za-z]*\\b")
list_len<- length(my_list)
num_acronyms = c()
acronyms = c()
for (i  in 1:list_len){
  num_acronyms[i] = length(my_list[[i]])
  acronyms[i] = str_c(my_list[[i]], collapse = ", " )
}
mydata <- mutate(mydata, num_acronyms = num_acronyms) %>%
              mutate(acronyms = acronyms)

mydata$acronyms[mydata_new$num_acronyms == 0] <- "NA"

mydata_new