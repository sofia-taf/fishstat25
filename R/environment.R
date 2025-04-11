#' @docType data
#'
#' @name environment
#'
#' @title Environments
#'
#' @description Aquatic environments for aquaculture, defined by FAO (2025).
#'
#' @usage
#' environment
#'
#' @format
#' Data frame containing two columns:
#' \tabular{ll}{
#'   \code{environment}      \tab environment code\cr
#'   \code{environment_name} \tab environment name
#' }
#'
#' @details
#' This data frame contains the full set of 4 data records from the FishStat
#' \emph{Production Environment} data table. Column names have been simplified
#' to facilitate quick exploration and plotting in R.
#'
#' @source
#' FAO (2025).
#' Aquaculture Production.
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
#' \code{\link{fishstat-package}} gives an overview of the package.
#'
#' @examples
#' environment
#'
#' # Aquaculture production by environment in 2023, in million tonnes
#' x <- merge(aquaculture, environment)
#' x <- aggregate(value~environment_name, x, sum, subset=year==2023)
#' transform(x, value=round(value/1e6))

NA
