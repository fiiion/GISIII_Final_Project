#### attempting to generalize some functions used in my final project

## Function 1: cleaning census data:

#' Cleaning Census data -- removing all but relevant variable and geometries
#'
#' @param census_table the table of census values extracted with API key
#'
#'  example -- pulling in census data: it should look something like this:
#'
#'  mpls_income2019 <- get_acs(geography = "tract", year = 2019,
#'  variables = c(med_earn = "S2001_C01_002E"), state = "MN",
#'  county = "Hennepin", survey = "acs5", output = "wide",
#'  geometry = TRUE)
#'
#'
#' @param variable_n the variable of interest, should be a character string
#'
#' @return a clean table with only the census variable and its geometries
#' Note: can be used int eh city_census_data function
#' @export
#'
#' @examples
clean_census_data <- function(census_table, variable_n) {
  ## census is the census data, variable_n is the variable of interest
  # variable_n should be input as a character string!

  ##### example -- pulling in census data: it should look something like this
  #mpls_income2019 <- get_acs(geography = "tract",
  #year = 2019,
  #variables = c(med_earn = "S2001_C01_002E"),
  #state = "MN",
  #county = "Hennepin",
  #survey = "acs5",
  #output = "wide",
  #geometry = TRUE)

  # this will return a table with 5 columns:
  # GeoID, Name, med_earn, S2001_C01_002M (error), and geometry
  # we only need med_earn (variable of interest) and geometry

  census_var <- census_table[variable_n]

}
