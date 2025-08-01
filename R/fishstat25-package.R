#' @name fishstat25-package
#'
#' @aliases fishstat25
#'
#' @title Global Fishery and Aquaculture Statistics
#'
#' @description
#' The Food and Agriculture Organization of the United Nations (FAO) FishStat
#' database is the leading source of global fishery and aquaculture statistics
#' and provides unique information for sector analysis and monitoring.
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
#' @section Joining Tables:
#' Production tables can be joined with lookup tables using the
#' \code{\link{merge}} function, as demonstrated in the help page examples for
#' \code{\link{aquaculture}} and \code{\link{capture}} production. The column
#' names in this package have been designed to allow automatic inference of
#' which columns to join, and the resulting table will have unique column names.
#'
#' The \code{merge} function is generally useful for joining tables, but other
#' join methods are available in R that can be faster but require either
#' additional packages or more coding. The \code{\link{production}} example uses
#' square brackets and the \code{match} function to add one lookup column at a
#' time to the production table. Compared to the slower \code{merge} function,
#' this saves time, both for users and CRAN servers running maintenance tests.
#'
#' Rather than optimizing speed or memory footprint, one can optimize
#' convenience by constructing a full table with all data records and all
#' columns:\preformatted{
#' prod.all <- merge(merge(merge(merge(merge(merge(production,
#'                   area), country), measure), source), species), status)
#' cap.all <- merge(merge(merge(merge(merge(capture,
#'                  area), country), measure), species), status)
#' aqua.all <- merge(merge(merge(merge(merge(merge(aquaculture,
#'                   area), country), environment), measure), species), status)}
#'
#' Popular paradigms for joining tables include:
#' \itemize{
#'   \item Base R, where \code{merge} returns a \code{data.frame}.
#'   \item The \code{dplyr} package, where \code{inner_join} returns a
#'         \code{tibble}.
#'   \item The \code{data.table} package, where \code{merge} returns a
#'         \code{data.table}.
#' }
#'
#' @note
#' The data in the package were downloaded from the FAO
#' \href{https://www.fao.org/fishery/static/Data/}{data server} and imported
#' into R. The R package version indicates the version of FishStat data it
#' includes. Column names have been simplified to facilitate quick exploration
#' and plotting in R.
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
#' database \href{https://www.fao.org/contact-us/terms/db-terms-of-use/en}{terms
#' of use} are based on the
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
#' @seealso
#' The package on CRAN provides the latest FishStat data, within a few weeks
#' after the official FAO data release. For research and reference purposes,
#' packages containing older data releases are available on GitHub with
#' descriptive names such as fishstat21 and fishstat22, containing the FAO
#' FishStat data releases from 2021 and 2022: \preformatted{
#' install_github("https://github.com/sofia-taf/fishstat21")
#' install_github("https://github.com/sofia-taf/fishstat22")}
#'
#' @examples
#' head(production)
#'
#' # Analyze production measured in tonnes
#' prod <- production[production$measure == "Q_tlw" & production$value > 0,]
#'
#' # Fast merge yearbook and inlandmarine columns
#' prod$yearbook <- species$yearbook[match(prod$species, species$species)]
#' prod$inlandmarine <- area$inlandmarine[match(prod$area, area$area)]
#'
#' # Select SOFIA species, excluding mammals, reptiles, and plants
#' prod <- prod[grep("Fish, crustaceans and molluscs", prod$yearbook, fixed=TRUE),]
#'
#' # Determine origin
#' prod$origin <- ifelse(prod$source == "CAPTURE", "Capture", "Aquaculture")
#' prod$w <- ifelse(prod$inlandmarine == "Marine areas", "marine", "inland")
#' prod$origin <- paste0(prod$origin, " (", prod$w, ")")
#' cbind(sort(unique(prod$origin)))
#'
#' # World capture fisheries and aquaculture production
#' x <- xtabs(value~year+origin, aggregate(value~year+origin, prod, sum))
#' x <- x[,c(2,1,4,3)] / 1e6
#' library(areaplot)
#' areaplot(x, legend=TRUE, args.legend=list(x="topleft"), ylab="million tonnes")

"_PACKAGE"
