#' @name fishstat25-package
#'
#' @aliases fishstat25
#'
#' @title Global Fishery and Aquaculture Statistics
#'
#' @description
#' The Food and Agriculture Organization of the United Nations (FAO)
#' \href{https://www.fao.org/fishery/en/fishstat}{FishStat} database is the
#' leading source of global fishery and aquaculture statistics and provides
#' unique information for sector analysis and monitoring.
#'
#' This package provides the global production data from all fisheries and
#' aquaculture in R format, ready for analysis.
#'
#' @details
#' \emph{Production tables:}
#' \tabular{ll}{
#'   \code{\link{aquaculture}} \tab aquaculture production\cr
#'   \code{\link{capture}}     \tab capture production\cr
#'   \code{\link{production}}  \tab aquaculture and capture production
#' }
#' \emph{Lookup tables:}
#' \tabular{ll}{
#'   \code{\link{area}}        \tab fishing areas\cr
#'   \code{\link{country}}     \tab countries and territories\cr
#'   \code{\link{environment}} \tab aquaculture environments\cr
#'   \code{\link{measure}}     \tab units of measurement\cr
#'   \code{\link{source}}      \tab sources of production\cr
#'   \code{\link{species}}     \tab taxonomic groups\cr
#'   \code{\link{status}}      \tab status of data entries
#' }
#'
#' @note
#' The data in the package were downloaded from the FAO
#' \href{https://www.fao.org/fishery/static/Data/}{data server} and imported
#' into R. The R package version indicates the version of FishStat data it
#' includes. Column names have been simplified to facilitate quick exploration
#' and plotting in R.
#'
#' Production tables can be joined with lookup tables using the
#' \code{\link{merge}} function, as demonstrated in the help page examples for
#' production tables. The column names in the R package have been designed to
#' allow automatic inference of which columns to join, and the resulting table
#' will have unique column names.
#'
#' To achieve a small memory footprint and fast computations, one can filter or
#' aggregate rows and select columns of interest before joining tables, as
#' demonstrated in the \code{capture} and \code{production} examples. On the
#' other hand, for the sake of convenience, one can also construct a full table
#' with all data records and all columns. The resulting table will have many
#' rows and columns, but most computers will handle these without
#' problems:\preformatted{
#' prod.all <- merge(merge(merge(merge(merge(merge(production,
#'                   area), country), measure), source), species), status)
#' cap.all <- merge(merge(merge(merge(merge(capture,
#'                  area), country), measure), species), status)
#' aqua.all <- merge(merge(merge(merge(merge(merge(aquaculture,
#'                   area), country), environment), measure), species), status)}
#'
#' When aggregating data, simple utility functions can be handy for tasks like
#' rounding the sum of thousands/millions of tonnes:\preformatted{
#' sum3 <- function(x, digits=0) round(sum(x)/1e3, digits=digits)
#' sum6 <- function(x, digits=0) round(sum(x)/1e6, digits=digits)
#' aggregate(value~environment, aquaculture, sum6)
#' aggregate(value~area, capture, sum6, subset=measure=="Q_tlw", digits=1)}
#'
#' An effort has been made to describe each table in the corresponding R help
#' page. However, the official and authoritative documentation of the FishStat
#' database is found on the FAO
#' \href{https://www.fao.org/fishery/en/fishstat}{FishStat} website.
#'
#' The example below demonstrates how the FishStat data can be used to produce
#' an overview of global fisheries and aquaculture. The combination of FishStat
#' and the R environment can also be very efficient for analyses that focus on
#' selected areas, countries, species, and/or taxonomic groups.
#'
#' @author
#' Arni Magnusson and Rishi Sharma created this R package.
#'
#' All credit for the FishStat database goes to the Statistics Team of the FAO
#' Fisheries and Aquaculture Division, as well as national data submitters. The
#' database
#' \href{https://www.fao.org/contact-us/terms/db-terms-of-use/en}{terms of use}
#' are based on the
#' \href{https://creativecommons.org/licenses/by-nc-sa/3.0/igo/}{CC BY-NC-SA 3.0
#' IGO} license. The R package is released under a similar
#' \href{https://creativecommons.org/licenses/by-nc-sa/4.0/}{CC BY-NC-SA 4.0}
#' license.
#'
#' \emph{To cite the use of FishStat data:}
#'
#' FAO. [Year].
#' FishStat data.
#' Fisheries and Aquaculture Division. Rome.
#' \url{https://www.fao.org/fishery/en/fishstat}.
#'
#' \emph{To cite the use of this R package to access the data, cite FishStat
#' (above) as well as:}
#'
#' Magnusson, A. and R. Sharma. [Year].
#' fishstat: Global Fishery and Aquaculture Statistics.
#' R package version [Version].
#' \url{https://cran.r-project.org/package=fishstat}.
#'
#' @examples
#' head(production)
#'
#' # Analyze production measured in tonnes
#' prod <- production[production$measure == "Q_tlw" & production$value > 0,]
#' prod <- merge(prod, species[c("species", "yearbook")])
#'
#' # Select SOFIA species, excluding mammals, reptiles, and plants
#' prod <- prod[prod$yearbook ==
#'              "Aquatic animals (Fish, crustaceans and molluscs, etc.)",]
#'
#' # Determine origin
#' prod <- merge(prod, area[c("area", "inlandmarine")])
#' prod$origin <- ifelse(prod$source == "CAPTURE", "Capture", "Aquaculture")
#' prod$w <- ifelse(prod$inlandmarine == "Marine areas", "marine", "inland")
#' prod$origin <- paste0(prod$origin, " (", prod$w, ")")
#'
#' # World capture fisheries and aquaculture production
#' x <- xtabs(value~year+origin, aggregate(value~year+origin, prod, sum))
#' x <- x[,c(2,1,4,3)] / 1e6
#' library(areaplot)
#' areaplot(x, legend=TRUE, args.legend=list(x="topleft"), ylab="million tonnes")

"_PACKAGE"
