
################ Simulating flexible uptake first

library(Rmisc)
library(ggplot2)
library(cowplot)

target_concentration<-data.frame(srp=c(90,68,51,33,11),din=c(81,244,365,488,650),NP=c(2,8,16,32,128))


np.sens.flexible<-data.frame()

setseed(0207)

for (j in 0:30){
  
error_percent<-(j/2)/100
error_bottom<-1-error_percent
error_top<-1+error_percent


for (i in 1:200){
  uptake.p<-runif(5,80,115)/100 ## uptake and release is plus or minus 30 percent of hte upsteram conc
  
  target_concentration$downstream.p<-target_concentration$srp*uptake.p
  
  target_concentration$p.uptake<-(target_concentration$srp-target_concentration$downstream.p)*(4)/(140) # 4ls discharge and 2*70m reach
  
  target_concentration$n.uptake.flexible<-(target_concentration$p.uptake/31)*14*target_concentration$NP ## mass based N uptake at 16:1 NP ratio
  
  target_concentration$n.concentration.flexible<-target_concentration$din-target_concentration$n.uptake.flexible*140/4
  
  
  n.uptake.error<-(target_concentration$din*runif(5,error_bottom,error_top)-target_concentration$n.concentration.flexible*runif(5,error_bottom,error_top))*(4)/(140)
  p.uptake.error<-(target_concentration$srp*runif(5,error_bottom,error_top)-target_concentration$downstream.p*runif(5,error_bottom,error_top))*4/140
  
  n.uptake.molar<-n.uptake.error/14
  p.uptake.molar<-p.uptake.error/31
  
  
  np.uptake<-n.uptake.molar/p.uptake.molar
  
  np<-data.frame(uptake=np.uptake,loading=target_concentration$NP,error=error_percent)
  np.sens.flexible<-rbind(np.sens.flexible,np)

}



}


##############
flexible<-aggregate(uptake~error+loading,data=np.sens.flexible,median)

cbbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73","#CC79A7")


error.np.flexible<-ggplot(flexible,aes(x=error*100,y=uptake,color=as.factor(loading)))+geom_point()+theme_classic()+geom_smooth(se=FALSE,method="lm")+
  xlab(expression("Measurement error %"))+ylab("Estimated N:P of uptake")+theme(text = element_text(size=20))+
  theme(legend.position = c(0.8, 0.81))+
  scale_color_manual(values=cbbPalette,name = "Supply N:P")+ggtitle("Flexible")
error.np.flexible



################
error.levels<-unique(flexible$error)

error.and.h.flexible<-data.frame(error=error.levels,h=NA)

for (i in 1:length(error.levels)){
  el<-error.levels[i]
  
  h.model<-lm(log(uptake)~log(loading),data=flexible[flexible$error==el,])
  
  error.and.h.flexible$h[i]<-coef(h.model)[2]
}

error.stoich.flexible<-ggplot(error.and.h.flexible,aes(x=error*100,y=h))+geom_point()+
  xlab(expression("Measurement error %"))+ylab(expression("Homeostasis coefficient ("*H^-1*")"))+
  theme_classic()+theme(text = element_text(size=20))+ggtitle("Flexible")
error.stoich.flexible

model<-lm(h~error,data=error.and.h.flexible)
anova(model)

################################# Homeostatic now


np.sens.homeostatic<-data.frame()


for (j in 0:30){
  
  error_percent<-(j/2)/100
  error_bottom<-1-error_percent
  error_top<-1+error_percent
  
  
  for (i in 1:200){
    uptake.p<-runif(5,80,120)/100 ## uptake and release is plus or minus 20 percent of the upstream conc
    
    target_concentration$downstream.p<-target_concentration$srp*uptake.p
    
    target_concentration$p.uptake<-(target_concentration$srp-target_concentration$downstream.p)*(4)/(140) # 4ls discharge and 2*70m reach
    
    target_concentration$n.uptake.homeostatic<-(target_concentration$p.uptake/31)*14*16 ## mass based N uptake at 16:1 NP ratio
    
    target_concentration$n.concentration.homeostatic<-target_concentration$din-target_concentration$n.uptake.homeostatic*140/4
    
    
    n.uptake.error<-(target_concentration$din*runif(5,error_bottom,error_top)-target_concentration$n.concentration.homeostatic*runif(5,error_bottom,error_top))*(4)/(140)
    p.uptake.error<-(target_concentration$srp*runif(5,error_bottom,error_top)-target_concentration$downstream.p*runif(5,error_bottom,error_top))*4/140
    
    n.uptake.molar<-n.uptake.error/14
    p.uptake.molar<-p.uptake.error/31
    
    
    np.uptake<-n.uptake.molar/p.uptake.molar
    
    np<-data.frame(uptake=np.uptake,loading=target_concentration$NP,error=error_percent)
    np.sens.homeostatic<-rbind(np.sens.homeostatic,np)
    
    
  }
  
  
  
}


##############
homeostatic<-aggregate(uptake~error+loading,data=np.sens.homeostatic,median)


error.np.homeostatic<-ggplot(homeostatic,aes(x=error*100,y=uptake,color=as.factor(loading)))+geom_point()+theme_classic()+geom_smooth(se=FALSE,method="lm")+
  xlab(expression("Measurement error %"))+ylab("Estimated N:P of uptake")+theme(text = element_text(size=20))+
  theme(legend.position = "none")+
  scale_color_manual(values=cbbPalette,name = "Supply N:P")+ggtitle("Homeostatic 16:1")
error.np.homeostatic



################

error.and.h.homeostatic<-data.frame(error=error.levels,h=NA)

for (i in 1:length(error.levels)){
  el<-error.levels[i]
  
  h.model<-lm(log(uptake)~log(loading),data=homeostatic[homeostatic$error==el,])
  
  error.and.h.homeostatic$h[i]<-coef(h.model)[2]
}

error.stoich.homeostatic<-ggplot(error.and.h.homeostatic,aes(x=error*100,y=h))+geom_point()+
  xlab(expression("Measurement error %"))+ylab(expression("Homeostasis coefficient ("*H^-1*")"))+
  theme_classic()+theme(text = element_text(size=20))+ggtitle("Homeostatic 16:1")

error.stoich.homeostatic

################ print figures


model2<-lm(h~error,data=error.and.h.homeostatic)
anova(model2)


setwd("C:\\Users\\nt78066\\OneDrive - University of Georgia\\Documents\\SNAX_3_nutrient_uptake\\")


tiff(filename="error_homeostasis_coefficient_percent.tiff",units="in",res=600,width=10,height=6,compression="lzw")
plot_grid(error.stoich.homeostatic,error.stoich.flexible,labels="AUTO",ncol=2,label_x=0.9,label_y=0.96,label_size = 20)
dev.off()

tiff(filename="error_np_uptake_percent.tiff",units="in",res=600,width=10,height=6,compression="lzw")
plot_grid(error.np.homeostatic,error.np.flexible,labels="AUTO",ncol=2,label_x=0.9,label_y=0.96,label_size = 20)
dev.off()

