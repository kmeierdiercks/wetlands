library(sp)
library(rgdal)

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

wetlands15n <- readOGR(
  dsn = "Wetlands/TX_Wetlands_UTM15.shp",
  layer = "TX_Wetlands_UTM15"
)

plot(ike_track15n, col = "red", xlim = c(175500, 459200), ylim = c(3148867, 3398625))
plot(counties15n, add = TRUE)
plot(wetlands15n, col = "green", add = TRUE)

