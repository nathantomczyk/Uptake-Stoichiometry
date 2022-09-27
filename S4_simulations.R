############# Simulating how continous addition biases rates of uptake. 

setwd("C:\\Users\\nt78066\\OneDrive - University of Georgia\\Documents\\SNAX_3_nutrient_uptake\\")
# not reading in data just storing figures

library(ggplot2)
library(cowplot)

#### Uptake occuring at a first order rate of loss or gain
background.conc<-1 #uM 
added.conc<-46 #uM 

### simulation with all added at top, and continous addition of nutrients
simulate_uptake<-function(k){
  
  blocks<-seq(0,65,by=5)
  
  d<-data.frame(blocks,conc=NA)
  
  d$conservative.conc<-background.conc+added.conc
  #block.size<-5 #m
  
  background.conc<-1 #uM 
  added.conc<-46 #uM 
  
  discharge<-1 # l s-1
  width<-1 #m
  
  
  
  
  d$conc[1]<-(background.conc+added.conc)*exp(k*5)
  
  # top addition
  for (i in 2:length(blocks)){
    
    d$conc[i]<-d$conc[i-1]*exp(k*5)
    
    
    
  }
  
  estimated.uptake.rate.top<-(d$conservative.conc[14]-d$conc[14])*discharge/(width*70) #70m is total reach length
  
  
  ### now what if the nutrients are being added along the reach.
  
  input.rate <- added.conc/14
  
  f<-data.frame(blocks,conc=NA,conservative.conc=NA)
  f$conservative.conc[1]<-background.conc+input.rate
  f$conc[1]<-(background.conc+input.rate)*exp(k*5)
  
  for (i in 2:length(blocks)){
    f$conservative.conc[i]<-f$conservative.conc[i-1]+input.rate
    f$conc[i]<-(f$conc[i-1]+input.rate)*exp(k*5)
    
    
    
  }
  
  estimated.uptake.rate.continous<-(f$conservative.conc[14]-f$conc[14])*discharge/(width*70) #70m is total reach length
  
  output<-data.frame(input.type=c("top","continous"),uptake.rate=c(estimated.uptake.rate.top,estimated.uptake.rate.continous))
  return(output)
}


### scenarios

uptake.lengths<-data.frame(sw=seq(-1000.5,1000.5,by=1))
uptake.lengths$k<-1/uptake.lengths$sw

scenarios<-data.frame()
#constant loss rate
for (i in 1:nrow(uptake.lengths)){
  one.k<-data.frame(simulate_uptake(uptake.lengths$k[i]))
  
  one.k$k<-uptake.lengths$k[i]
  one.k$sw<-uptake.lengths$sw[i]
  
  output<-data.frame(k=uptake.lengths$k[i],sw=uptake.lengths$sw[i],top.uptake=one.k$uptake.rate[1],continous=one.k$uptake.rate[2])
  
  scenarios<-rbind(scenarios,output)
  
}

constant_proportional<-ggplot(scenarios[scenarios$top.uptake>-2,],aes(x=top.uptake,y=continous,color=sw))+geom_point()+
  geom_point()+theme_classic()+
  xlab(expression(italic("NNE")~"top addition ("*mu*mol~m^-2~s^-1*")"))+
  ylab(expression(italic("NNE")~"longitudinal ("*mu*mol~m^-2~s^-1*")"))+
  theme(text =element_text(size=20))+
  geom_hline(yintercept = 0,linetype="dashed")+
  geom_abline(intercept = 0,slope=1,color="red",linetype="dashed",size=3)+
  theme(legend.position=c(0.2,0.8))
constant_proportional

scenarios$bias<-scenarios$top.uptake/scenarios$continous

ggplot(scenarios[scenarios$top.uptake>-2,],aes(x=sw,y=abs(bias)))+geom_point()+
  theme_classic()


summary(lm(continous~top.uptake,data=scenarios[scenarios$top.uptake>-2,]))

#### micheleas-menten uptake
uptake.function<-function(concentration,umax,ks){
  uptake<-(concentration*umax)/(concentration+ks)## mm kinetics with max uptake rate of 0.5 and ks of 40
  uptake
}

background.conc<-1 #uM 
added.conc<-46 #uM 

### simulation with all added at top, and continous addition of nutrients
simulate_uptake<-function(umax,ks){

d<-data.frame(blocks,conc=NA)

d$conservative.conc<-background.conc+added.conc
#block.size<-5 #m

background.conc<-1 #uM 
added.conc<-46 #uM 

discharge<-1 # l s-1
width<-1 #m

blocks<-seq(0,65,by=5)


d$conc[1]<-background.conc+added.conc-uptake.function(background.conc+added.conc,umax,ks)*width*5/discharge

for (i in 2:length(blocks)){
  
  d$conc[i]<-d$conc[i-1]-uptake.function(d$conc[i-1],umax,ks)*(width*5)/discharge
  
  
  
}

estimated.uptake.rate.top<-(d$conservative.conc[14]-d$conc[14])*discharge/(width*70) #70m is total reach length


### now what if the nutrients are being added along the reach.

input.rate <- added.conc/14

f<-data.frame(blocks,conc=NA,conservative.conc=NA)
f$conservative.conc[1]<-background.conc+input.rate
f$conc[1]<-background.conc+input.rate-uptake.function(background.conc+input.rate,umax,ks)

for (i in 2:length(blocks)){
  f$conservative.conc[i]<-f$conservative.conc[i-1]+input.rate
  f$conc[i]<-f$conc[i-1]+input.rate-uptake.function(concentration=f$conc[i-1]+input.rate,umax,ks)*(width*5)/discharge
  
  
  
}

estimated.uptake.rate.continous<-(f$conservative.conc[14]-f$conc[14])*discharge/(width*70) #70m is total reach length

output<-data.frame(input.type=c("top","continous"),uptake.rate=c(estimated.uptake.rate.top,estimated.uptake.rate.continous))
return(output)
}


#### examining diffrent scenarios

range_of_ks<-seq(5,40,by=0.2)
range_of_umax<-seq(-1.9,1.9,by=0.05)

sims<-data.frame(ks=rep(range_of_ks,each=length(range_of_umax)),umax=rep(range_of_umax,times=length(range_of_ks)))

results<-data.frame()
for (i in 1:nrow(sims)){
  one_sim<-simulate_uptake(sims$umax[i],sims$ks[i])
  
  output<-data.frame(continous.uptake=one_sim$uptake.rate[2],top.uptake=one_sim$uptake.rate[1],ks=sims$ks[i],umax=sims$umax[i])
  results<-rbind(results,output)
}

MM_uptake<-ggplot(results,aes(x=top.uptake,y=continous.uptake))+geom_point()+theme_classic()+
  xlab(expression(italic("NNE")~"top addition ("*mu*mol~m^-2~s^-1*")"))+
  ylab(expression(italic("NNE")~"longitudinal ("*mu*mol~m^-2~s^-1*")"))+
  theme(text =element_text(size=20))+
  geom_hline(yintercept = 0,linetype="dashed")+
  geom_abline(intercept = 0,slope=1,color="red",linetype="dashed",size=3)
MM_uptake


summary(lm(continous.uptake~top.uptake,results))

results$absolute.error<-results$top.uptake-results$continous.uptake

bias.figure<-ggplot(results,aes(x=top.uptake,y=absolute.error,color=ks))+geom_point()+theme_classic()+
  xlab(expression(italic("NNE")~"top addition ("*mu*mol~m^-2~s^-1*")"))+
  ylab(expression("Bias ("*mu*mol~m^-2~s^-1*")"))+
  theme(text =element_text(size=20))
bias.figure

summary(lm(abs(absolute.error)~abs(top.uptake),results))
summary(lm(abs(absolute.error)~ks,results))
summary(lm(abs(absolute.error)~umax,results))

results$relative.error<-1-abs(results$continous.uptake)/abs(results$top.uptake)


ks.figure<-ggplot(results,aes(x=ks,y=relative.error*100,color=top.uptake))+geom_point()+theme_classic()+
  xlab("Half saturation constant (ks)")+
  ylab("Bias %")+
  theme(text =element_text(size=20))+
  scale_color_continuous(name = "NNE")
ks.figure

range(results$relative.error,na.rm=TRUE)

ggplot(results,aes(x=ks,y=relative.error,color=umax))+geom_point()

summary(lm(relative.error~abs(top.uptake),results))
summary(lm(relative.error~ks,results))
summary(lm(relative.error~umax,results))
### what if net uptake is not sensitive to concentraiton?


simulate_uptake_no_concentraiton_effect<-function(rate){
  
  d<-data.frame(blocks,conc=NA)
  
  d$conservative.conc<-background.conc+added.conc
  #block.size<-5 #m
  
  background.conc<-1 #ug l-1
  added.conc<-46 #ug l-1
  
  discharge<-1 # l s-1
  width<-1 #m
  
  blocks<-seq(0,65,by=5)
  
  
  d$conc[1]<-(background.conc+added.conc)-rate*(width*5)/discharge
  
  for (i in 2:length(blocks)){
    
    d$conc[i]<-d$conc[i-1]-rate*(width*5)/discharge
    
    
    
  }
  
  estimated.uptake.rate.top<-(d$conservative.conc[14]-d$conc[14])*discharge/(width*70) #70m is total reach length
  
  
  ### now what if the nutrients are being added along the reach.
  
  input.rate <- added.conc/14
  
  f<-data.frame(blocks,conc=NA,conservative.conc=NA)
  f$conservative.conc[1]<-background.conc+input.rate
  f$conc[1]<-(background.conc+input.rate)-rate*(width*5)/discharge
  
  for (i in 2:length(blocks)){
    f$conservative.conc[i]<-f$conservative.conc[i-1]+input.rate
    f$conc[i]<-f$conc[i-1]-rate*(width*5)/discharge+input.rate
    
    
    
  }
  
  estimated.uptake.rate.continous<-(f$conservative.conc[14]-f$conc[14])*discharge/(width*70) #70m is total reach length
  
  output<-data.frame(input.type=c("top","continous"),uptake.rate=c(estimated.uptake.rate.top,estimated.uptake.rate.continous))
  return(output)
}


range_of_rates<-seq(-1.9,1.9,by=0.01)

results2<-data.frame()
for (i in 1:length(range_of_rates)){
  one_sim<-simulate_uptake_no_concentraiton_effect(range_of_rates[i])
  output<-data.frame(true.rate=range_of_rates[i],top.uptake=one_sim$uptake.rate[1],cont.uptake=one_sim$uptake.rate[2])
  
  results2<-rbind(results2,output)
}

non.conc.sens<-ggplot(results2,aes(x=top.uptake,y=cont.uptake))+geom_point()+theme_classic()+
  xlab(expression(italic("NNE")~"top addition ("*mu*mol~m^-2~s^-1*")"))+
  ylab(expression(italic("NNE")~"longitudinal addition ("*mu*mol~m^-2~s^-1*")"))+
  theme(text =element_text(size=20))
non.conc.sens

summary(lm(true.rate~cont.uptake,data=results2))

tiff(filename="bias.analaysis1.tiff",units="in",res=600,width=8,height=8,compression="lzw")
non.conc.sens
dev.off()

tiff(filename="bias.analaysis2.tiff",units="in",res=600,width=6,height=14,compression="lzw")
plot_grid(MM_uptake,bias.figure,ks.figure ,ncol=1,labels="AUTO",label_x=0.2,label_y=0.95)
dev.off()



########## Figure to illustrate the different assumptions. scenarios. 
blocks<-seq(0,70,by=5)

rate<-0.5

background.conc<-1 #ug l-1
added.conc<-46 #ug l-1

discharge<-1 # l s-1
width<-1 #m

d<-data.frame(blocks,conc=NA)
  
d$conservative.conc<-background.conc+added.conc
  #block.size<-5 #m

d$conc[1]<-background.conc+added.conc
  
for (i in 2:length(blocks)){
    
d$conc[i]<-d$conc[i-1]-rate*(width*5)/discharge
    
    
    
}
  
### now what if the nutrients are being added along the reach.
  
input.rate <- added.conc/15
  
f<-data.frame(blocks,conc=NA,conservative.conc=NA)
f$conservative.conc[1]<-background.conc+input.rate
f$conc[1]<-background.conc+input.rate
  
for (i in 2:length(blocks)){
  f$conservative.conc[i]<-f$conservative.conc[i-1]+input.rate
  f$conc[i]<-f$conc[i-1]-rate*(width*5)/discharge+input.rate
    
    
    
}
  
d$type<-"Top addition"
f$type<-"Longitudinal addition"

constant_rate<-rbind(d,f)

constant_rate_figure<-ggplot(constant_rate,aes(x=blocks,y=conc,color=type))+geom_line(size=2)+theme_classic()+
  geom_line(data=constant_rate,aes(x=blocks,y=conservative.conc,color=type),linetype="dashed",size=2)+
  xlab("Distance from top of reach (m)")+ylab("Concentraiton (uM)")+
  theme(text =element_text(size=20))+theme(legend.position = "none")


#### constant proportional loss
k<-(-0.01)

d<-data.frame(blocks,conc=NA)
  
d$conservative.conc<-background.conc+added.conc
  #block.size<-5 #m
  
d$conc[1]<-background.conc+added.conc
  
# top addition
for (i in 2:length(blocks)){
    
    d$conc[i]<-d$conc[i-1]*exp(k*5)
    
    
    
}
  

  ### now what if the nutrients are being added along the reach.
  
  input.rate <- added.conc/15
  
  f<-data.frame(blocks,conc=NA,conservative.conc=NA)
  f$conservative.conc[1]<-background.conc+input.rate
  f$conc[1]<-background.conc+input.rate
  
  for (i in 2:length(blocks)){
    f$conservative.conc[i]<-f$conservative.conc[i-1]+input.rate
    f$conc[i]<-f$conc[i-1]*exp(k*5)+input.rate
    
    
    
  }
  
  
d$type<-"Top addition"
f$type<-"Longitudinal addition"
  
constant_proportional_rate<-rbind(d,f)
  
constant_proportional_rate_figure<-ggplot(constant_proportional_rate,aes(x=blocks,y=conc,color=type))+geom_line(size=2)+theme_classic()+
    geom_line(data=constant_proportional_rate,aes(x=blocks,y=conservative.conc,color=type),linetype="dashed",size=2)+
    xlab("Distance from top of reach (m)")+ylab("Concentraiton (uM)")+
    theme(text =element_text(size=20))+theme(legend.position = "none")
constant_proportional_rate_figure


######### michaleas menten 

umax<-(1)
ks<-40

d<-data.frame(blocks,conc=NA)
  
d$conservative.conc<-background.conc+added.conc
  #block.size<-5 #m
  
d$conc[1]<-background.conc+added.conc
  
for (i in 2:length(blocks)){
    
    d$conc[i]<-d$conc[i-1]-uptake.function(d$conc[i-1],umax,ks)*(width*5)/discharge
    
    
    
}
  
  estimated.uptake.rate.top<-(d$conservative.conc[15]-d$conc[15])*discharge/(width*70) #70m is total reach length
  
  
  ### now what if the nutrients are being added along the reach.
  
  input.rate <- added.conc/15
  
  f<-data.frame(blocks,conc=NA,conservative.conc=NA)
  f$conservative.conc[1]<-background.conc+input.rate
  f$conc[1]<-background.conc+input.rate
  
for (i in 2:length(blocks)){
    f$conservative.conc[i]<-f$conservative.conc[i-1]+input.rate
    f$conc[i]<-f$conc[i-1]-uptake.function(concentration=f$conc[i-1],umax,ks)*(width*5)/discharge+input.rate
}    
    
d$type<-"Top addition"
f$type<-"Longitudinal addition"
  
mm<-rbind(d,f)
  
mm_figure<-ggplot(mm,aes(x=blocks,y=conc,color=type))+geom_line(size=2)+theme_classic()+
    geom_line(data=mm,aes(x=blocks,y=conservative.conc,color=type),linetype="dashed",size=2)+
    xlab("Distance from top of reach (m)")+ylab("Concentraiton (uM)")+
    theme(text =element_text(size=20))+theme(legend.position = "none")
mm_figure

library(cowplot)

tiff(filename="longitudinal.tiff",units="in",res=600,width=6,height=14,compression="lzw")
plot_grid(constant_rate_figure,constant_proportional_rate_figure,mm_figure,ncol=1,labels="AUTO",label_x=0.9,label_y=0.2)
dev.off()

mm_figure<-ggplot(mm,aes(x=blocks,y=conc,color=type))+geom_line(size=2,linetype="dashed")+theme_classic()+
  geom_line(data=mm,aes(x=blocks,y=conservative.conc,color=type),linetype="dashed",size=2)+
  xlab("Distance from top of reach (m)")+ylab("Concentraiton (uM)")+
  theme(text =element_text(size=20))
mm_figure

tiff(filename="legend.tiff",units="in",res=600,width=6,height=6,compression="lzw")
mm_figure
dev.off()


tiff(filename="constant_proportional.tiff",units="in",res=600,width=6,height=6,compression="lzw")
constant_proportional
dev.off()
