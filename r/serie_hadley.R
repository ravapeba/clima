library(ggplot2)

# get series from Hadleys's Centre web page

get_hadley_global_annual <- function() {
  # gets Hadley Center's Global Temperature Series
  
  # url to global annual temperatures
  url_hadley <- 'https://www.metoffice.gov.uk/hadobs/hadcrut5/data/HadCRUT.5.0.2.0/analysis/diagnostics/HadCRUT.5.0.2.0.analysis.summary_series.global.annual.csv'

  temp_hadley <- read.csv(url_hadley, header=TRUE, sep=',')
  names(temp_hadley) <- c('Year','Tanom','lower','upper')
  invisible(temp_hadley)
} # fin de get_hadley_global_annual

# plot serie 

plot_hadley <- function(temps,tit,subtit,caption){
	plot <- ggplot(temps,aes(x = Year, y = Tanom, colour=y))+ geom_line(colour="#FF9999")+theme_bw(base_size=14)+
	  labs(title=tit,subtitle=subtit,caption=caption)
	return(plot)
} # fin de plot_hadley 

#decorations

decora <- function(plot,color,fontsize,xbreaks,ybreaks,xlab,ylab,hline){
plot <- plot +
geom_line(colour=color,size=0.5)+theme_bw(base_size=fontsize)+
scale_x_continuous(breaks = xbreaks)+
scale_y_continuous(breaks = ybreaks)+
xlab(xlab)+ylab(ylab)+
geom_hline(yintercept=hline, size=0.5, linetype="dashed", color = "grey", alpha=0.8)

return(plot)
} # fin de decora 

color <- 'red'
fontsize <- 12
xbreaks <- seq(1855,2025,by=10)
ybreaks <- seq(-0.8,1.2,by=0.2)
xlab <- 'Año'
ylab <- 'Anomalía de temperatura'
hline <- 0  

tit_global='Valor medio global temperatura en superficie'
subtit_had='Anomalía relativa a la media de 1961-1990 - Serie original -'

# get the data and produce the plots

temp_hadley_global_annual <- get_hadley_global_annual()
plot_hadley_global_annual <- plot_hadley(temp_hadley_global_annual[1:175,],tit_global,subtit_had,'')
plot_hadley_global_annual2 <- decora(plot_hadley_annual,color,fontsize,xbreaks,ybreaks,xlab,ylab,hline)
ggsave(file=paste0(dir_clima_img,"serie_hadley_global_annual.svg"), plot=plot_hadley_global_annual2, width=8, height=6)