library(ggplot2)
library(lubridate)
library(hockeystick)
#library(svglite)

.libPaths()

get_datos <- function(file,skip) {
  datos <- read.csv(file, header=TRUE, skip=skip, sep=',')
  invisible(datos)
}

plot_datos <- function(datos,tit,subtit,caption){
plot <- ggplot(datos,aes(x = Year, y = Tanom, colour=y))+
  geom_line(colour="#FF9999")+theme_bw(base_size=14)+
  labs(title=tit,
       subtitle=subtit,
       caption=caption)
return(plot)
}

#### decora grafico ggplot
decora1 <- function(plot,color,fontsize,xbreaks,ybreaks,xlab,ylab,hline){
plot <- plot +
geom_line(colour=color,size=0.5)+theme_bw(base_size=fontsize)+
scale_x_continuous(breaks = xbreaks)+
scale_y_continuous(breaks = ybreaks)+
xlab(xlab)+ylab(ylab)+
geom_hline(yintercept=hline, size=0.5, linetype="dashed", color = "grey", alpha=0.8)

return(plot)
}

### quitar un paquete
detach_package <- function(pkg, character.only = FALSE)
{
  if(!character.only)
  {
    pkg <- deparse(substitute(pkg))
  }
  search_item <- paste("package", pkg, sep = ":")
  while(search_item %in% search())
  {
    detach(search_item, unload = TRUE, character.only = TRUE)
  }
}

## uso
detach_package(vegan)
