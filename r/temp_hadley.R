raizR <-  'C:/F/clima/r/'
source(paste0(raizR,'funciones1.R'))
source(paste0(raizR,'fdirs1.R'))
source(paste0(raizR,'strings1.R'))

#### plot hadley center global temperature data

library(ggplot2)

get_hadley <- function() {
  # gets Hadley Center's Global Temperature Series
  
  url_hadley <- 'https://www.metoffice.gov.uk/hadobs/hadcrut5/data/HadCRUT.5.0.2.0/analysis/diagnostics/HadCRUT.5.0.2.0.analysis.summary_series.global.annual.csv'

  datos <- read.csv(url_hadley, header=TRUE, sep=',')
  names(datos) <- c('Year','Tanom','lower','upper')
  # datos <- dplyr::select(datos,1,2)
  invisible(datos)
}

temp <- get_hadley()

lx <- seq(1855,2025,by=10)
ly <- seq(-0.8,1.2,by=0.2)
color <- 'red'
fontsize <- 12
xbreaks <- lx
ybreaks <- ly 
hline <- 0
xlab <- 'Año'
ylab <- 'Anomalía de temperatura'

plot_had <- plot_datos(temp,tit_global,subtit_had,'')
plot_had <- decora1(plot_had,'#FF9999',10,xbreaks,ybreaks,xlab,ylab,0)

ggsave(file=paste0(dir_clima_img,"serie_had.svg"), plot=plot_had, width=8, height=6)

#### plot data hadley smooth10
mov10 = stats::filter(datos_had$Tanom, filter = rep(1/10, 10), method = 'convolution', sides = 1)
datos_had10 <- data.frame(datos_had$Year,mov10)
temp10 <- datos_had10[,c(1,2)]
names(temp10) <- c("Year","Tanom")
ylab <- ''

plot_had10 <- plot_datos(temp10,tit_global,subtit_had10,'')
plot_had10 <- decora1(plot_had10,'#FF9999',10,xbreaks,ybreaks,xlab,ylab,0)

# plot both annual-decadal hadley
plot_had_1y10 <- plot_had+plot_had10
ggsave(file=paste0(dir_clima_img,"serie_had_1y10.svg"), plot=plot_had_1y10, width=12, height=9)


