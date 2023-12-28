# Install and load required packages if not already installed
if (!requireNamespace("sf", quietly = TRUE)) {
  install.packages("sf")
}

if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}

if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}

library(sf)
library(dplyr)
library(readr)


setwd("D:/JKI_Publications/JunanelDataset29112023/Plots_R1-R3/Plot_R3")

# Function to convert shapefile to CSV with attributes and coordinates
convert_shp_to_csv <- function(shp_file_path) {
  # Read shapefile
  shp_data <- st_read(shp_file_path)
  
  # Extract file name without extension
  file_name <- tools::file_path_sans_ext(basename(shp_file_path))
  
  # Access the attribute table (data frame)
  attribute_table <- as.data.frame(shp_data)
  
  # Access the geometry column (coordinates)
  coordinates <- st_coordinates(shp_data$geometry)
  
  # Combine the attribute table and coordinates
  combined_data <- cbind(attribute_table, coordinates)
  
  # Define CSV file path
  csv_file_path <- paste0(file_name, "_with_coordinates.csv")
  
  # Write CSV file
  write_csv(combined_data, csv_file_path)
  
  cat(paste("Conversion complete: ", csv_file_path, "\n"))
}

# Specify the directory containing shapefiles
shapefile_directory <- "D:/JKI_Publications/JunanelDataset29112023/Plots_R1-R3/Plot_R3/Yield_2008"

# List all shapefiles in the directory
shapefiles <- list.files(shapefile_directory, pattern = "\\.shp$", full.names = TRUE)

# Loop through each shapefile and convert to CSV with attributes and coordinates
for (shp_file in shapefiles) {
  convert_shp_to_csv(shp_file)
}
