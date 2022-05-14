#' Intersect census data with boundaries
#
#'
#' @param census_var table with the census variable of interest and associated geometries
#' can use clean_census_data to get this input
#'
#' (created for census tracts & city boundaries, should work for other sizes)
#'
#'
#' @param bounds the boundaries to intersect with the census variable
#'
#' @return city_int -- the intersected geometries with the boundary
#' @export
#'
#' @examples
#'
#'
#'
#'
city_census_data <- function(census_var, bounds) {
  ## census == census data, bounds == boundaries (shp., etc)

  ### step 1: setting the CRS -------------------------------------
  # we need the CRS of the census data to match boundary data
  # we'll choose to use the census CRS, as this will be consistent

  # creating a new object -- boundary with amended CRS
  bounds_CRS <- st_transform(bounds, st_crs(census_var))

  ### step 2: intersecting the bounds and the data ----------------
  city_int <- st_intersection(census_var, bounds_CRS)

  ## this ^ will be returned automatically! yay
  # now I'll try to add documentation...

}
