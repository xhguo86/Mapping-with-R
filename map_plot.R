# set options
options(stringsAsFactors = F)         # no automatic data transformation
options("scipen" = 100, "digits" = 4) # suppress math annotation
op <- options(gvis.plot.tag='chart')  # set gViz options
# install libraries
install.packages(c("OpenStreetMap", "DT", "RColorBrewer", "mapproj", "sf", "RgoogleMaps", 
                   "scales", "rworldmap", "maps", "tidyverse", "rnaturalearth", 
                   "rnaturalearthdata", "rgeos", "ggspatial", "maptools", "leaflet", "sf", 
                   "tmap", "here", "rgdal", "scales"))
# install package from github
devtools::install_github("dkahle/ggmap", ref = "tidyup")

# load library
library(OpenStreetMap)
# load package 
library(DT)

# load library
library(rworldmap)
library("ggplot2")
theme_set(theme_bw())
library("sf")
library("rnaturalearth")
library("rnaturalearthdata")
library(magrittr)
library(ggspatial)

# load data 
setwd("C:\\R files")

library(ggplot2)
library(tidyverse)
library(RColorBrewer)
library(ggpubr)

#txt, tab sep
data<-read.table("map data.txt",header=T,dec=",")
attach(data)
str(data)
data$latitude <- as.numeric(data$latitude)
data$longitude <- as.numeric(data$longitude)
data$design  <- as.factor(data$design) 
world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

#cbp_1 <- c("azure4", "lightcoral","red","firebrick4")

# gene world map
worldmap <- ggplot(data = world) +
  geom_sf(color = "lightgrey", fill = "grey") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("World map of ...xxx")+ 
  #annotation_scale(location = "bl", width_hint = 0.5) +
  #annotation_north_arrow(location = "bl", which_north = "true", pad_x = unit(0.75, "in"), 
  #      pad_y = unit(0.5, "in"), style = north_arrow_fancy_orienteering) +
  coord_sf(xlim = c(-140, 170), ylim = c(-75, 90), expand = FALSE)+ 
  theme(panel.grid.major = element_line(
        color = gray(0.1), size = 0.1,
        linetype = "dashed"), 
        panel.background = element_rect(fill = "white"))+
  theme_bw()
# add points
# plot data on world map
worldmap+
# add points
  geom_point(data = data, mapping = aes(x = longitude, y = latitude,color =design), 
             #color = cbp_1,
             alpha = 1, size=1)+
  scale_color_manual(values=c(NC="green", ND="orange",  NR="yellow", NW="red"))
ggsave("map_1.png", width = 12, height = 9, dpi = 1200)























# get map
worldmap <- getMap(resolution = "coarse")
# plot world map
plot(worldmap, col = "lightgrey", 
     fill = T, border = "gray",
     xlim = c(-180, 180), ylim = c(-90, 90),
     bg = "white",
     asp = 1, wrap=c(-180,180))

# add points
points(data$longitude, data$latitude,col = "red", cex = .01, pch = 20)

# load packages
library(tidyverse)
library(rnaturalearth)
library(rnaturalearthdata)
# load data
world <- ne_countries(scale = "medium", returnclass = "sf")
# gene world map
ggplot(data = world) +
  geom_sf() +
  labs( x = "Longitude", y = "Latitude") +
  ggtitle("World map", subtitle = paste0("(", length(unique(world$admin)), " countries)"))


# plot data on world map
plot(worldmap, xlim = c(-140, 160), ylim = c(-50, 100), 
     asp = 1, bg = "white", col = "gray", fill = T, border = "lightgray")
# add points
points(airports$Longitude, airports$Latitude,col = "red", cex = .01, pch = 20)

##################################################################################
# get map
newmap <- getMap(resolution = "low")
# plot map
plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), 
     asp = 1, fill = T, border = "darkgray", 
     col = "wheat2", bg = "gray95")
# add points
points(airports$Longitude, airports$Latitude, col = "red", cex = .5)

