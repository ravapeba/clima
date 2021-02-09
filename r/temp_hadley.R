source('c:/clima/R/funciones1.R')
source('c:/clima/R/fdirs1.R')
source('c:/clima/R/strings1.R')

#### ploteo datos temperatura hadley center
datos_hadley_glob <- read.csv(fhadley, header=FALSE, skip=17, sep='')
temp <- datos_hadley_glob[,c(1,2)]
names(temp) <- c("Year","Tanom")

xbreaks <- round(seq(1840, 2020, by = 20),1)
ybreaks <- round(seq(-0.6, 0.8, by = 0.2),1)
xlab <- 'Año'
ylab <- 'Anomalía de temperatura'

plot_had <- plot_datos(temp,tit_global,subtit_had,'')
plot_had <- decora1(plot_had,'#FF9999',10,xbreaks,ybreaks,xlab,ylab,0)

ggsave(file="c:/clima/img/serie_had.svg", plot=plot_had, width=8, height=6)

#### ploteo datos hadley smooth10
datos_hadley_glob <- read.csv(fhadley10, header=FALSE, skip=17, sep='')
temp10 <- datos_hadley_glob[,c(1,2)]
names(temp10) <- c("Year","Tanom")
ylab <- ''

plot_had10 <- plot_datos(temp10,tit_global,subtit_had10,'')
plot_had10 <- decora1(plot_had10,'#FF9999',10,xbreaks,ybreaks,xlab,ylab,0)

# ploteo comparativo anual-decadal hadley
plot_had_1y10 <- plot_had+plot_had10
ggsave(file=paste0(dir_blog_img,"serie_had_1y10.svg"), plot=plot_had_1y10, width=8, height=6)
ggsave(file=paste0(dir_clima_img,"serie_had_1y10.svg"), plot=plot_had_1y10, width=8, height=6)


