# The Spatial Distribution of Income in US Cities

## Introduction 

Last quarter, I did a project on building demolitions in Chicago. In it, I incorporated four census variables at the tract level to create a Neighborhood Change Index, with middling success. For this project, I narrowed the focus to a single variable – individual median income – and scaled the project up from one city to three. 

I focused on income because it’s a concrete number that serves as a proxy for almost every other demographic: including race, marriage status, life expectancy, and disability. Further, according to historian Natalia Petrzela, the last five decades have seen the [“privatization of the good life”](https://archive.ph/jWwTt#selection-827.508-827.544) in American society. In other words, expendable income has become increasingly necessary for services once provided by the government, and therefore has a large bearing on quality of life. 

## Goals and Objectives

I had three goals for this project. I wanted to make directly comparable choropleth maps for American cities showing the relative distributions of income in the cities. However, not every city has the same cost of living. So the benchmarks I used are: earning minimum wage, can afford housing (makes more than three times the average cost of apartment rent), and earning more than six figures. These distinctions are socially understood, and can somewhat account for the geographic dependence of income and housing costs in the US. Further, they aid my second goal, which was to be able to share the results in a meaningful way with a broad audience. My third goal was to incorporate reproducibility into the project, so it would be possible to make visualizations for more cities.


## Data Sources, Spatial and Temporal Scale

In total, I pulled data from four different sources. For the income data and census tract geometries, I used the census API to pull in data from the ACS aggregated over 2015 to 2019.[^1] For each city, I also needed to pull city boundary data. I did this from each city’s data portal.[^2][^3][^4] Finally, I used an online resource to determine the average rent in each city.[^5]

As mentioned, the temporal scale of the project is a five year aggregate from 2015 to 2019. It would be very interesting to do a historical investigation into a city – see how wealth has shifted or concentrated over time – but an analysis of recent data is the most relevant to an audience of contemporary Americans, and so became my focus. I would have liked to make the spatial scale as large as possible (within the United States). Including more cities would have appealed to a broader audience and perhaps yielded unexpected insights related to regional variations. 

## Methods 

This project had multiple components. My first focus was producing the choropleth maps showing the distribution of income relative to socially understood benchmarks. I did this entirely in R (the code can be found [here](https://github.com/fiiion/GISIII_Final_Project/blob/main/Collecting_Census_data_RMD.Rmd) and [here](https://github.com/fiiion/GISIII_Final_Project/blob/main/Visualizing_Inc_Data.Rmd)). Because one of my goals was reproducibility, I made scripts using some of the code used to make the visualizations, which I then incorporated into a [package](https://github.com/fiiion/GISIII_Final_Project/tree/main/Package_FP-main). 

After completing these visualizations, I turned to Python to see what other information I could extract from the results. I attempted a KMeans clustering analysis of income in Chicago (which can be found in [this](https://github.com/fiiion/GISIII_Final_Project/blob/main/pysal_inc_clustering/inc_clustering_with_pysal.ipynb) notebook). Failing to properly execute this, I instead turned to centroid analysis. I plotted the centroid locations of the tracts with the highest and lowest incomes in each city, and calculated the distance between them. I also made simple charts showing the density distribution of incomes in each city.

Finally, I incorporated all of the pieces into a single StoryMap, which provided me with a template to communicate the results in a linear and aesthetically pleasing manner. It also enabled me to easily incorporate other media, such as photographs from the cities. 
    

## Results

![Chi](https://github.com/fiiion/GISIII_Final_Project/blob/main/visualizations/chi_updated.png)
![Mpls](https://github.com/fiiion/GISIII_Final_Project/blob/main/visualizations/mpls_updated.png)
![Sd](https://github.com/fiiion/GISIII_Final_Project/blob/main/visualizations/sd_updated.png)

For the StoryMap, see [here](https://storymaps.arcgis.com/stories/8f4e630173324d7599a7e2d01217aaed).

## Discussion of Results

Perhaps the most surprising result was that the cities all have the same minimum wage ($15/hr, more than twice federal minimum wage), and yet they have significantly different costs of living. In particular, the cost of renting an apartment makes a large impact on the affordability of a city. Almost no census tracts in San Diego had median incomes high enough to afford to rent an apartment at ⅓ of their income. This is primarily because, given the average rent in San Diego, adhering to this guideline would require a person to make almost six figures. By comparison, the income requirement for Minneapolis was around $60,000 a year. However, examining the income density plots reveals that the vast majority of earners are making around $40,000 a year, irrespective of location. This would indicate that housing costs are a leading source of financial insecurity in cities across the United States. 

## Limitations, Future Work, Conclusion

This was a project with a relatively simple goal: show how income is distributed across US cities. The intended simplicity of the project, however, introduced other complications. One issue that arose was replication. The choropleth breaks included city-specific values that had to be sought out for each new city added. Further, cities are not uniform in size or shape, making it more difficult to create a single function that can produce consistent visualizations using tmap. This is the reason no such script was incorporated into the project’s package (although I currently have an idea of how to do it). 

I would also like to test my scripts! I had initially intended to do four cities, but could not find city boundary data for the final city. I later found a dataset containing city boundaries across the United States, which would enable more standardized application of the code. 

The format of the results also proved to be a challenge for my goal of increasing the spatial and temporal dimensions of the project. Although I’m pleased with the way it turned out (and it matches my original vision for the project), if I were to move forward with this project, I would need to incorporate the results into an open source visualization. Presenting the results in an RShiny application, for example, would allow anyone to see the project’s set-up and contribute to it.

[^1]: U.S. Census Bureau (2020). _2015-2019 American Community Survey Median Earnings in the Past 12 Months for the Full-Time,     Year-Round Civilian Employed Population_. Retrieved from 
  [URL](https://api.census.gov/data/2010/acs/acs1/subject/variables/S2001_C01_001E.json).
[^2]: City of San Diego (2017). _San Diego city boundary_. 
  Retrieved from [URL](https://data.sandiego.gov/datasets/san-diego-boundary/).
[^3]: City of Minneapolis (2020). _City Boundary_. Retrieved from 
  [URL](https://opendata.minneapolismn.gov/datasets/cityoflakes::city-boundary/explore?location=44.970896%2C-93.261718%2C12.41)
[^4]: Chicago Data Portal (2022). _Boundary - City_. Retrieved from
  [URL](https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-City/ewy2-6yfk)
[^5]: [URL](https://www.rentcafe.com/rent-affordability-calculator/)
