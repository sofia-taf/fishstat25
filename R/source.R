#' @docType data
#'
#' @name source
#'
#' @title Sources
#'
#' @description
#' Sources of aquaculture and capture production, defined by FAO (2025).
#'
#' @usage
#' source
#'
#' @format
#' Data frame containing two columns:
#' \tabular{ll}{
#'   \code{source}      \tab source code\cr
#'   \code{source_name} \tab source name
#' }
#'
#' @details
#' This data frame contains the full set of 4 data records from the FishStat
#' \emph{Production Source} data table. Column names have been simplified
#' to facilitate quick exploration and plotting in R.
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
#' source
#'
#' # Analyze production measured in tonnes
#' prod <- production[production$measure == "Q_tlw" & production$value > 0,]
#' prod <- merge(prod, source)
#'
#' # Production by source in 2023, in million tonnes
#' x <- aggregate(value~source_name, prod, sum, subset=year==2023)
#' transform(x, value=round(value/1e6))

NA
