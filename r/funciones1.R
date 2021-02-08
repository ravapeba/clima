library(ggplot2)
library(lubridate)
library(hockeystick)
#library(svglite)

.libPaths()

get_datos <- function(file,skip) {
  datos <- read.csv(file, header=TRUE, skip=skip, sep=',')
  invisible(datos)
}

plot_datos <- function(datos,tit,subtit,ejex,ejey,caption){
plot <- ggplot(datos,aes(x = Year, y = Tanom, colour=y))+
  geom_line(colour="#FF9999")+theme_bw(base_size=14)+
  labs(title=tit,
       subtitle=subtit,
	 x=ejex,
       y=ejey,
       caption=caption)
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
