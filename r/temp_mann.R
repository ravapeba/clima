source('c:/clima/R/funciones1.R')
source('c:/clima/R/fdirs1.R')
source('c:/clima/R/strings1.R')

#### ploteo dos milenios after Mann 2003, 2 últimos milenios
#datos_mann_HN <- get_datos(fmann_HN,skip_mann)
#plot_datos(datos_HN,tit_HN,subtit,ejex,ejey,caption_mann)
datos_mann_glob <- get_datos(fmann_global,skip_mann)
plot_mann <- plot_datos(datos_mann_global,tit_global,subtit_mann,ejex,ejey,'')
plot_mann <- plot_mann+
geom_line(colour="#FF9999",size=0.5)+theme_bw(base_size=14)+
scale_x_continuous(breaks = round(seq(200, 2000, by = 200),1))+
scale_y_continuous(breaks = round(seq(-0.4, 0.3, by = 0.1),1))+
geom_hline(yintercept=0, size=0.5, color = "grey")
ggsave(file="c:/clima/img/serie_mann.svg", plot=plot_mann, width=8, height=6)

#### ploteo conjunto datos Mann2003 + Hadley Center - decadales
datos_hadley_glob <- read.csv(fhadley10, header=FALSE, skip=17, sep='')
temp10 <- datos_hadley_glob[,c(1,2)]
names(temp10) <- c("Year","Tanom")
temp10 <- subset(temp10, Year>1980)
# construyo fichero conjunto mann-had
temp_mann <- subset(datos_mann_glob, Year<1850)
datos_mann_had_glob <- rbind(temp_mann,temp10)
plot_mann_had <- plot_datos(datos_mann_had_glob,tit_global,subtit_mann,ejex,ejey,'')
plot_mann_had <- plot_mann_had+
geom_line(colour="#FF9999",size=0.75)+theme_bw(base_size=14)+
scale_x_continuous(breaks = round(seq(200, 2000, by = 200),1))+
scale_y_continuous(breaks = round(seq(-0.4, 0.8, by = 0.1),1))+
geom_hline(yintercept=0, size=0.5, color = "grey", alpha=0.8)+
annotate("rect", xmin = 1850, xmax = 2020, ymin =-Inf, ymax = Inf, alpha = 0.1)+
geom_vline(xintercept=1850, alpha=0.8, size=0.5, color="grey")+

ggsave(file=paste0(dir_blog_img,'serie_mann_had2.svg'), plot=plot_mann_had, width=8, height=6)
ggsave(file=paste0(dir_clima_img,'serie_mann_had2.svg'), plot=plot_mann_had, width=8, height=6)

