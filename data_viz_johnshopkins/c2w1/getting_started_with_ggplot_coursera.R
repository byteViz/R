library(tidyverse)

#####Load the data (if you want, you could do this locally from your computer rather than download from Dropbox)

cel <- read_csv(url("https://www.dropbox.com/s/4ebgnkdhhxo5rac/cel_volden_wiseman%20_coursera.csv?raw=1"))

names(cel)
dim(cel)
table(cel$year)
summary(cel$all_bills)

#for making a scatterplot

####filter the data we want
fig115 <- filter(cel,congress==115)
fig115 <- select(fig115,"seniority","all_pass")

####these commands do the same thing as above, just with piping
fig115 <- cel %>% filter(congress==115) %>% select("seniority","all_pass")

###check to make sure the filter worked properly
head(fig115)

####set up the data and aesthetics
ggplot(fig115,aes(x=seniority,y=all_pass))

####add the marks
ggplot(fig115,aes(x=seniority,y=all_pass))+
  geom_point()

####jitter adds random noise to the data to avoid overplotting
ggplot(fig115,aes(x=seniority,y=all_pass))+
  geom_jitter()

####add some labels and a title
ggplot(fig115,aes(x=seniority,y=all_pass))+
  geom_jitter()+
  labs(x="Seniority",y="Bills Passed",title="Seniority and Bills Passed in the 115th Congress")

#####modify filter and select to grab "dem"

fig115 <- cel %>% 
  filter(congress==115) %>% 
  select("seniority","all_pass","dem")

fig115$dem

ggplot(fig115,aes(x=seniority,y=all_pass,color=dem))+
  geom_jitter()+
  labs(x="Seniority",y="Bills Passed",title="Seniority and Bills Passed in the 115th Congress")

####colors are strange, let's fix

#####make dem a categorical variable called "party"
party <- recode(fig115$dem,`1`="Democrat",`0`="Republican")

fig115 <- add_column(fig115,party)

fig115$party

ggplot(fig115,aes(x=seniority,y=all_pass,color=party))+
  geom_jitter()+
  labs(x="Seniority",y="Bills Passed",title="Seniority and Bills Passed in the 115th Congress")

####let's make the colors match traditional blue democrats and red republicans

ggplot(fig115,aes(x=seniority,y=all_pass,color=party))+
  geom_jitter()+
  labs(x="Seniority",y="Bills Passed",title="Seniority and Bills Passed in the 115th Congress")+
  scale_color_manual(values=c("blue","red"))

#####make two separate plots using facet_wrap

ggplot(fig115,aes(x=seniority,y=all_pass,color=party))+
  geom_jitter()+
  labs(x="Seniority",y="Bills Passed",title="Seniority and Bills Passed in the 115th Congress")+
  scale_color_manual(values=c("blue","red"))+
  facet_wrap(~party)




