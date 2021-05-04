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
# get map
worldmap <- getMap(resolution = "coarse")
# plot world map
plot(worldmap, col = "lightgrey", 
     fill = T, border = "darkgray",
     xlim = c(-180, 180), ylim = c(-90, 90),
     bg = "aliceblue",
     asp = 1, wrap=c(-180,180))

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
plot(worldmap, xlim = c(-80, 160), ylim = c(-50, 100), 
     asp = 1, bg = "lightblue", col = "black", fill = T)
# add points
points(airports$Longitude, airports$Latitude, 
       col = "red", cex = .01)

##################################################################################
# get map
newmap <- getMap(resolution = "low")
# plot map
plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), 
     asp = 1, fill = T, border = "darkgray", 
     col = "wheat2", bg = "gray95")
# add points
points(airports$Longitude, airports$Latitude, col = "red", cex = .5, pch = 20)
