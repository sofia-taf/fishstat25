#' @docType data
#'
#' @name capture
#'
#' @title Global Capture Production
#'
#' @description
#' Capture production quantity by species, area, and country for the years
#' 1950-2023, compiled and published by FAO (2025).
#'
#' @usage
#' capture
#'
#' @format
#' Data frame containing seven columns:
#' \tabular{ll}{
#'   \code{species} \tab \code{\link{species}} code\cr
#'   \code{year}    \tab year\cr
#'   \code{area}    \tab \code{\link{area}} code\cr
#'   \code{country} \tab \code{\link{country}} code\cr
#'   \code{value}   \tab quantity in tonnes or number of individuals\cr
#'   \code{measure} \tab \code{\link{measure}} code\cr
#'   \code{status}  \tab \code{\link{status}} code
#' }
#'
#' @details
#' This data frame contains the full set of 1,055,015 data records from the
#' FishStat \emph{Capture Quantity} data table. Column names have been
#' simplified to facilitate quick exploration and plotting in R.
#'
#' @source
#' FAO (2025).
#' Global Capture Production.
#' Fisheries and Aquaculture Division. Rome.
#'
#' \url{https://www.fao.org/fishery/en/collection/capture}
#'
#' @seealso
#' \code{\link{aquaculture}} and \code{\link{capture}} data are also
#' available in a combined \code{\link{production}} format.
#'
#' \code{\link{area}}, \code{\link{country}}, \code{\link{environment}},
#' \code{\link{measure}}, \code{\link{source}}, \code{\link{species}}, and
#' \code{\link{status}} are lookup tables.
#'
#' \code{\link{fishstat-package}} gives an overview of the package.
#'
#' @examples
#' head(capture)
#'
#' # Analyze catches measured in tonnes
#' cap <- aggregate(value~species+year, capture, sum, subset=measure=="Q_tlw")
#' cap <- merge(cap, species[c("species", "species_name", "major")])
#'
#' # Top 10 capture species in 2023
#' x <- aggregate(value~species_name, cap, sum, subset=year==2023)
#' x$value <- round(x$value)
#' head(x[order(-x$value),], 10)
#'
#' # Total capture production by major taxa since 1950, in million tonnes
#' x <- aggregate(value~tolower(major), cap, function(x) round(sum(x/1e6)))
#' x[x$value > 0,]
#'
#' # Annual capture production of all aquatic animals
#' x <- aggregate(value~year, cap, sum)
#' plot(value/1e6~year, x, ylim=c(0,105), ylab="million tonnes", type="l")
#' title(main="Capture production: All")

NA
