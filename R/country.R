#' @docType data
#'
#' @name country
#'
#' @title Countries
#'
#' @description Countries and various territories, defined by FAO (2025).
#'
#' @usage
#' country
#'
#' @format
#' Data frame containing eight columns:
#' \tabular{ll}{
#'   \code{country}      \tab country code\cr
#'   \code{country_name} \tab country name\cr
#'   \code{iso2}         \tab ISO 2-alpha code\cr
#'   \code{iso3}         \tab ISO 3-alpha code\cr
#'   \code{continent}    \tab continent\cr
#'   \code{georegion}    \tab geographic region\cr
#'   \code{ecoclass}     \tab economic class\cr
#'   \code{official}     \tab official country name
#' }
#'
#' @details
#' This data frame contains the full set of 275 data records from the FishStat
#' \emph{Country Groups} data table. Column names have been simplified to
#' facilitate quick exploration and plotting in R.
#'
#' @source
#' FAO (2025).
#' Global Production.
#' Fisheries and Aquaculture Division. Rome.
#'
#' \url{https://www.fao.org/fishery/en/collection/global_production}
#'
#' @seealso
#' \code{\link{aquaculture}} and \code{\link{capture}} data are also
#' available in a combined \code{\link{production}} format.
#'
#' \code{\link{area}}, \code{\link{country}}, \code{\link{environment}},
#' \code{\link{measure}}, \code{\link{source}}, \code{\link{species}}, and
#' \code{\link{status}} are lookup tables.
#'
#' \code{\link{fishstat25-package}} gives an overview of the package.
#'
#' @examples
#' head(country)
#'
#' # Regions within continents
#' table(country$georegion, country$continent)
#'
#' # Select country entries that have non-zero production
#' nonzero <- unique(production$country[production$value > 0])
#' country.nz <- country[country$country %in% nonzero,]
#' length(country.nz$country)
#'
#' # Only country and country_name are always defined
#' cbind(sapply(country, function(x) all(x != "")))
#'
#' # Plus ecoclass and official for non-zero production
#' cbind(sapply(country.nz, function(x) all(x != "")))
#'
#' # Economic class levels
#' sort(unique(country$ecoclass))
#'
#' # Examine individual countries
#' print.simple.list(country[country$iso2 == "IS",])
#' print.simple.list(country[country$country_name == "Samoa",])

NA
