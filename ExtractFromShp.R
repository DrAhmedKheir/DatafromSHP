# Install and load required packages
install.packages("sf")
library(sf)

# Set the working directory to the folder containing your shapefile
setwd("D:/JKI_Publications/JunanelDataset29112023/Rextraction")

# Read the shapefile
shapefile <- st_read("D:/JKI_Publications/JunanelDataset29112023/Plots_VII-VIII/Plot_VIII/Yield_2017/WG_17_VIII.shp")

# Display information about the shapefile
print(shapefile)

# Extract the latitude and longitude from the geometry
shapefile$latitude <- st_coordinates(shapefile)[, "Y"]
shapefile$longitude <- st_coordinates(shapefile)[, "X"]

# Extract the attribute table with latitude and longitude
attribute_table <- dplyr::select(shapefile, -geometry)
# Print the attribute table
print(attribute_table)
# Save the attribute table to a CSV file
write.csv(attribute_table, "WG_17_VIII.csv", row.names = FALSE)
