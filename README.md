# Analysis of Economic Development in Mato Grosso

This repository contains the data and code for an econometric and spatial analysis of the economy of Mato Grosso, focusing on the impact of institutions like the land market and transportation infrastructure on production.

---

##  Files and Description

Here is a breakdown of the key files and directories in this project:

* **Notebooks for Visualization** 
    * `Land Market and Transports.ipynb`: A Jupyter Notebook used to plot maps related to the land market and transportation infrastructure.
    * `Mesorregions plot.ipynb`: A Jupyter Notebook specifically for plotting the maps of Mato Grosso's mesoregions.
    * `GDP-Plot.ipynb`: A Jupyter Notebook specifically for plotting Mesoregional GDP yearly.

* **Econometric Analysis** 
    * `Production - regression estimation.do`: This is a Stata `.do` file containing the script used to run the regression estimations for the production analysis.

* **Data** 
    * `Database for regression.xlsx`: The main dataset used in the Stata `.do` file for the regression analysis.
    * `Table 1.xlsx`: An Excel file containing data on colonization projects in the region.
    * **BR_UF_2024/**: This directory contains the shapefile for all Brazilian states, used to create an **inset map** in the `Land Market and Transports.ipynb` notebook.
    * **MT_Municipios_2022/**: This directory contains the shapefile of Mato Grosso's municipal boundaries, which are used to construct the **mesoregion contours** in the `Mesorregions plot.ipynb` notebook.
    * **Rodovias/**: This directory contains the shapefile of federal **highways**, plotted in the `Land Market and Transports.ipynb` notebook.
    * **PIB Municipal/**: This directory contains the data for plotting `GDP-Plot.ipynb` notebook.

---

##  How to Use

1.  To view the spatial analysis, open the Jupyter Notebooks (`.ipynb` files).
2.  To replicate the econometric analysis, run the `Production - regression estimation.do` file in Stata, ensuring the `Database for regression.xlsx` file is accessible.
