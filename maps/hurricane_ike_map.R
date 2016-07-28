library(sp)
library(rgdal)
library(raster)

setwd("C://Users/kmeierdiercks/Google\ Drive/Projects/Coastal_Wetlands_Hurricane/GIS/Data")

ike_track <- readOGR(
  dsn = "Hurricanes/IKE08/al092008_track.shp",
  layer = "al092008_track"
)

proj1 <- "+proj=utm +zone=15 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0"
ike_track15n <- spTransform(ike_track, proj1)

counties15n <- readOGR(
  dsn = "Counties/counties_UTM15N.shp",
  layer = "counties_UTM15N"
)

affected_counties <- subset(counties15n,GEOID %in% c("48071", "48167", "48039","48245", "01017", "48201", "13145"))

#LOADING WETLANDS SEEMS TO BE CRASHING r-STUDIO
#wetlands15n <- readOGR(
#  dsn = "Wetlands/TX_Wetlands_UTM15.shp",
#  layer = "TX_Wetlands_UTM15"
#)

GDP15n <- raster("GDP_NighttimeSky/gdp_utm15")


#plot(wetlands15n, col = "green", add = TRUE)
plotxlim = c(175000,450000)
plot(GDP15n, xlim = plotxlim, ylim = c(3148867, 3398625))
plot(counties15n, add = TRUE)
plot(affected_counties, xlim = plotxlim, border = "blue", lwd=1.8, add = TRUE)
plot(ike_track15n, col = "red", lwd=3, add = TRUE)
title("Hurricane Ike 2008")

dev.copy(png,'Hurricane_Ike.png')
dev.off()



