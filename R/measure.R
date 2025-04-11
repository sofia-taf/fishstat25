#' @docType data
#'
#' @name measure
#'
#' @title Measures
#'
#' @description Units of measurement, defined by FAO (2025).
#'
#' @usage
#' measure
#'
#' @format
#' Data frame containing seven columns:
#' \tabular{ll}{
#'   \code{measure}             \tab measure code\cr
#'   \code{measure_name}        \tab measure name\cr
#'   \code{short}               \tab short name\cr
#'   \code{multiplier}          \tab unit multiplier\cr
#'   \code{unit}                \tab unit symbol\cr
#'   \code{measure_description} \tab measure description\cr
#'   \code{sws}                 \tab SWS code
#' }
#'
#' @details
#' This data frame contains the full set of 11 data records from the FishStat
#' \emph{Units} data table. Column names have been simplified to facilitate
#' quick exploration and plotting in R.
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
#' head(measure, 3)
#'
#' # Aquaculture production is measured in tonnes live weight
#' table(aquaculture$measure)
#'
#' # Capture production is measured in tonnes or number of individuals
#' table(capture$measure)
#'
#' # When number of individuals is used, it is for mammals and reptiles
#' x <- merge(capture[capture$measure=="Q_no_1",], species)
#' aggregate(value~isscaap, x, sum)
#' aggregate(value~isscaap, x, sum, subset=year==2023)
#'
#' # Examine one measure
#' print.simple.list(measure[measure$measure=="Q_tlw",])

NA
