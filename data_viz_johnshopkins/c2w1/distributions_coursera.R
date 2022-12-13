library(tidyverse)

cces<- read_csv(url("https://www.dropbox.com/s/ahmt12y39unicd2/cces_sample_coursera.csv?raw=1"))

#####boxplots

###make a basic boxplot
ggplot(cces,aes(y=faminc_new))+geom_boxplot()

####break up boxplots by education group -- add a aesthetic mapping for group
ggplot(cces,aes(y=faminc_new,group=educ))+
  geom_boxplot()

####add labels and a title
ggplot(cces,aes(y=faminc_new,group=educ))+
  geom_boxplot()+
  labs(x="Income Level",y="Family Income",title="Family Inc. by Respondent Ed. Level")

####reformat the data to create a dichotomous categorical variable for four-year college grads or more, and then all respondents with 2 year college degrees or less

cces$educ_category <- recode(cces$educ,`1`="<4 yr Degree",`2`="<4 yr Degree",`3`="<4 yr Degree",`4`="<4 yr Degree",`5`="4 yr Deg. +",`6`="4 yr Deg. +")

###make sure you change the aesthetic mapping so the new categorical variable is mapped to "x" rather than "group"

ggplot(cces,aes(y=faminc_new,x=educ_category))+
  geom_boxplot()+
  labs(x="Income Level",y="Family Income",title="Family Inc. by Respondent Ed. Level")


####make a histogram
ggplot(cces,aes(x=faminc_new))+
  geom_histogram()

####make a density plot
ggplot(cces,aes(x=faminc_new))+
  geom_density()

