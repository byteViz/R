library(tidyverse)

cel <- read_csv(url("https://www.dropbox.com/s/4ebgnkdhhxo5rac/cel_volden_wiseman%20_coursera.csv?raw=1"))

####bar plot for dems variable in the 115th Congress. 0=Republican, 1=Democrat

cel %>% 
  filter(congress==115) %>% 
  ggplot(aes(x=dem))+
  geom_bar()

###prove to yourself your bar plot is right by comparing with a frequency table:
table(filter(cel,congress==115)$dem)


###use st_name instead, so how counts of how many members of Congress from each state:
  
cel %>% filter(congress==115) %>% ggplot(aes(x=st_name))+geom_bar()

###flip the figure by setting y aesthetic rather than the x

cel %>% filter(congress==115) %>% ggplot(aes(y=st_name))+geom_bar()

###let's go back and recode the dem variable to be a categorical variable

party <- recode(cel$dem,`1`="Democrat",`0`="Republican")

cel <- add_column(cel,party)

cel %>% filter(congress==115)%>% ggplot(aes(x=party))+
  geom_bar()

####now add some visual touches

###add axis labels
cel %>% filter(congress==115)%>% ggplot(aes(x=party))+
  geom_bar()+
  labs(x="Party",y="Number of Members")

###add colors for the two different bars
  cel %>% filter(congress==115)%>% ggplot(aes(x=party,fill=party))+
    geom_bar()+
    labs(x="Party",y="Number of Members")

###manually change the colors of the bars
  cel %>% filter(congress==115)%>% ggplot(aes(x=party,fill=party))+
  geom_bar()+
  labs(x="Party",y="Number of Members")+
  scale_fill_manual(values=c("blue","red"))

###drop the legend with the "guides" command
cel %>% filter(congress==115)%>% ggplot(aes(x=party,fill=party))+
  geom_bar()+
  labs(x="Party",y="Number of Members")+
  scale_fill_manual(values=c("blue","red"))+
  guides(fill=FALSE)


#####Making more barplots and manipulating more data in R

####Making a barplot of proportions

#####a toy demonstration
#####a bowl of fruit
apple <- rep("apple",6)
orange <- rep("orange",3)
banana <- rep("banana",1)

###put together the fruits in a dataframe
###creates a single columns with fruits
fruit_bowl <- tibble("fruits"=c(apple,orange,banana))

########Let's calculate proportions instead

#####create a table that counts fruits in a second column
fruit_bowl_summary <- fruit_bowl %>% 
  group_by(fruits) %>% 
  summarize("count"=n())

fruit_bowl_summary

####calculate proportions
fruit_bowl_summary$proportion <- fruit_bowl_summary$count/sum(fruit_bowl_summary$count)

fruit_bowl_summary

####add the geom_bar, using "stat" to tell command to plot the exact value for proportion
ggplot(fruit_bowl_summary,aes(x=fruits,y=proportion))+
  geom_bar(stat="identity")

ggplot(fruit_bowl_summary,aes(x=fruits,y=proportion,fill=fruits))+
  geom_bar(stat="identity")+
  scale_fill_manual(values=c("red","yellow","orange"))+
  guides(fill=FALSE)+
  labs(x="Fruits",y="Proportion of Fruits")



####More practice with barplots!

#####
cces <- read_csv(url("https://www.dropbox.com/s/ahmt12y39unicd2/cces_sample_coursera.csv?raw=1"))

####create counts of Ds, Rs, and Is by region

dem_rep <- recode(cces$pid7,`1`="Democrat",`2`="Democrat",`3`="Democrat",`4`="Independent",`5`="Republican",`6`="Republican",`7`="Republican")

table(dem_rep)

cces <- add_column(cces,dem_rep)

###stacked bars
ggplot(cces,aes(x=region,fill=dem_rep))+
  geom_bar()

###grouped bars
ggplot(cces,aes(x=region,fill=dem_rep))+
  geom_bar(position="dodge")

##visual touches like relabeling the axes
ggplot(cces,aes(x=region,fill=dem_rep))+
  geom_bar(position="dodge")+
  labs(x="Region",y="Count")

