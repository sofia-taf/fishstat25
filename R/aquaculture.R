#' @docType data
#'
#' @name aquaculture
#'
#' @title Global Aquaculture Production
#'
#' @description
#' Aquaculture production quantity by species, area, country, and aquatic
#' environment for the years 1950-2023, compiled and published by FAO (2025).
#'
#' @usage
#' aquaculture
#'
#' @format
#' Data frame containing eight columns:
#' \tabular{ll}{
#'   \code{species}     \tab \code{\link{species}} code\cr
#'   \code{year}        \tab year\cr
#'   \code{area}        \tab \code{\link{area}} code\cr
#'   \code{country}     \tab \code{\link{country}} code\cr
#'   \code{value}       \tab quantity in tonnes\cr
#'   \code{measure}     \tab \code{\link{measure}} code\cr
#'   \code{status}      \tab \code{\link{status}} code\cr
#'   \code{environment} \tab \code{\link{environment}} code
#' }
#'
#' @details
#' This data frame contains the full set of 104,598 data records from the
#' FishStat \emph{Aquaculture Quantity} data table. Column names have been
#' simplified to facilitate quick exploration and plotting in R.
#'
#' @source
#' FAO (2025).
#' Global Aquaculture Production.
#' Fisheries and Aquaculture Division. Rome.
#'
#' \url{https://www.fao.org/fishery/en/collection/aquaculture}
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
#' head(aquaculture)
#'
#' # Add species columns
#' aqua <- merge(aquaculture, species)
#'
#' # Top 10 aquaculture species in 2023, production in tonnes
#' x <- aggregate(value~species_name, aqua, sum, subset=year==2023)
#' x$value <- round(x$value)
#' head(x[order(-x$value),], 10)
#'
#' # Total aquaculture production by major taxa since 1950, in million tonnes
#' aggregate(value~tolower(major), aqua, function(x) round(sum(x/1e6)))
#'
#' # Annual aquaculture production of all animals
#' x <- aggregate(value~year, aqua, sum, subset=major!="PLANTAE AQUATICAE")
#' plot(value/1e6~year, x, ylab="million tonnes", type="l")
#' title(main="Aquaculture production: All animals")

NA
