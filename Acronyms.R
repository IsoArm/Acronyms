library(tidyverse)
library(stringr)

mydata = tibble(
  text = c("ARA vonC EM, qezanic zzvUM", "hh fgr rrr, grt", "AMF fftb RRTVvRF")
  )
my_list <- str_extract_all(mydata$text, "\\b[A-Za-z]*[A-Z]{2,}[A-Za-z]*\\b")
list_len<- length(my_list)
num_acronyms = c()
acronyms = c()
for (i  in 1:list_len){
    if(!is.null(my_list[[i]])) {acronyms[i] <- str_c(my_list[[i]], collapse = ", " )
                              num_acronyms[i] <- length(my_list[[i]])
  } else{
    num_acronyms[i] <- 0
    acronyms[i] <- "No match"
  }
}
mydata_new <- mutate(mydata, num_acronyms = num_acronyms) %>%
              mutate(acronyms = acronyms)

#mydata$acronyms[mydata$num_acronyms == 0] <- "NA"
mydata_new
