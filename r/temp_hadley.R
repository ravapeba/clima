source('c:/clima/R/funciones1.R')
source('c:/clima/R/fdirs1.R')
source('c:/clima/R/strings1.R')

#### ploteo datos temperatura hadley center
datos_hadley_glob <- read.csv(fhadley, header=FALSE, skip=17, sep='')
temp <- datos_hadley_glob[,c(1,2)]
names(temp) <- c("Year","Tanom")
plot_had <- plot_datos(temp,tit_global,subtit_had,ejex,ejey,'')
plot_had <- plot_had+
geom_line(colour="#FF9999",size=0.5)+theme_bw(base_size=10)+
scale_x_continuous(breaks = round(seq(1840, 2020, by = 20),1))+
scale_y_continuous(breaks = round(seq(-0.6, 0.8, by = 0.2),1))+
geom_smooth(colour="#444499",mapping = NULL,data = NULL,stat = "smooth",
position = "identity",method = NULL,formula = NULL,se = TRUE,na.rm = FALSE,
orientation = NA,show.legend = NA,inherit.aes = TRUE,size=0.5)
ggsave(file="c:/clima/img/serie_had.svg", plot=plot_had, width=8, height=6)

#### ploteo datos hadley smooth10
datos_hadley_glob <- read.csv(fhadley10, header=FALSE, skip=17, sep='')
temp10 <- datos_hadley_glob[,c(1,2)]
names(temp10) <- c("Year","Tanom")
plot_had10 <- plot_datos(temp10,tit_global,subtit_had10,ejex,ejey,'')
plot_had10 <- plot_had10+
geom_line(colour="#FF9999",size=0.75)+theme_bw(base_size=10)+
scale_x_continuous(breaks = round(seq(1840, 2020, by = 20),1))+
scale_y_continuous(breaks = round(seq(-0.6, 0.8, by = 0.2),1))

# ploteo comparativo anual-decadal hadley
plot_had_1y10 <- plot_had+plot_had10
ggsave(file=paste0(dir_blog_img,"serie_had_1y10.svg"), plot=plot_had_1y10, width=8, height=6)
ggsave(file=paste0(dir_clima_img,"serie_had_1y10.svg"), plot=plot_had_1y10, width=8, height=6)
