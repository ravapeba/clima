source('c:/clima/R/funciones1.R')
source('c:/clima/R/fdirs1.R')
source('c:/clima/R/strings1.R')

#### datos del testigo de hielo de vostok, temperatura y CO2
datos_vostok_temp <- read.csv(fvostok_temp, header=TRUE, skip=57, sep='')
datos_vostok_carbon <- read.csv(fvostok_carbon, header=TRUE, skip=20, sep='')

xlab <- c(400,360,320,280,240,200,160,120,80,40,0)

plot_vostok_temp <- ggplot(datos_vostok_temp,aes(x = Year, y = Tanom, colour=y))+
geom_line(colour="#FF9999",size=0.75)+theme_bw(base_size=11)+
scale_x_reverse(labels=rev(xlab), breaks = round(seq(0, 420000, by = 40000),1))+
scale_y_continuous(breaks = round(seq(-10, 3, by = 2),1))+
xlab('')+ylab('Anomalía de temperatura (ref -55ºC)')+
geom_hline(yintercept=0, size=0.5, color = "grey")

#### ploteo datos CO2
plot_vostok_carbon <- ggplot(datos_vostok_carbon,aes(x = Year, y = Tanom, colour=y))+
geom_line(colour="#9999FF",size=0.75)+theme_bw(base_size=12)+
scale_x_reverse(labels=rev(xlab), breaks = round(seq(0, 420000, by = 40000),1))+
scale_y_continuous(breaks = round(seq(180, 300, by = 30),1))+
xlab('Miles de años')+ylab('Concentración de CO2 en ppm')

vostok_ambos <- ggarrange(plot_vostok_temp, plot_vostok_carbon, labels = c("", ""),ncol = 1, nrow = 2)

ggsave(file=paste0(dir_blog_img,'serie_vostok.svg'), plot=vostok_ambos, width=8, height=6)
ggsave(file=paste0(dir_clima_img,'serie_vostok.svg'), plot=vostok_ambos, width=8, height=6

#### periodo abarcando younger dryas
xlab <- seq(40000,0, by = -4000)
dryas <- subset(datos_vostok_temp, Year<40000)

ggplot(dryas,aes(x = Year, y = Tanom, colour=y))+
geom_line(colour="#FF9999",size=0.75)+theme_bw(base_size=11)+
scale_x_reverse(labels=rev(xlab), breaks = round(seq(0, 40000, by = 4000),1))+
scale_y_continuous(breaks = round(seq(-10, 3, by = 2),1))+
xlab('')+ylab('Anomalía de temperatura (ref -55ºC)')+
geom_hline(yintercept=0, size=0.5, color = "grey")

#### periodo abarcando tales años, desde ini hasta fin

ini <- 0 
fin <- 20000
cada <- -2000
xlab <- seq(fin,ini, by = cada)
tales <- subset(datos_vostok_temp, Year<fin)
tales <- subset(ultimos, Year>ini)

ggplot(tales,aes(x = Year, y = Tanom, colour=y))+
geom_line(colour="#FF9999",size=0.75)+theme_bw(base_size=11)+
scale_x_reverse(labels=rev(xlab), breaks = round(seq(ini, fin, by = 2000),1))+
scale_y_continuous(breaks = round(seq(-10, 2, by = 1),1))+
xlab('')+ylab('Anomalía de temperatura (ref -55ºC)')+
geom_hline(yintercept=0, size=0.5, color = "grey")




