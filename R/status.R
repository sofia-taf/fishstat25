#' @docType data
#'
#' @name status
#'
#' @title Status
#'
#' @description Status of data entries, defined by FAO (2025).
#'
#' @usage
#' status
#'
#' @format
#' Data frame containing four columns:
#' \tabular{ll}{
#'   \code{status}             \tab status code\cr
#'   \code{status_name}        \tab status name\cr
#'   \code{status_description} \tab short name\cr
#'   \code{alternate}          \tab unit multiplier
#' }
#'
#' @details
#' This data frame contains the full set of 16 data records from the FishStat
#' \emph{Symbols} data table. Column names have been simplified to facilitate
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
#' head(status, 3)
#'
#' # Aquaculture data entries
#' # Percentage that have official status, estimated, and negligible
#' 100 * proportions(table(aquaculture$status))
#'
#' # Capture data entries
#' # Percentage that have official status, estimated, and negligible
#' 100 * proportions(table(capture$status))
#'
#' # Examine one status definition
#' print.simple.list(status[status$status=="N",])

NA
