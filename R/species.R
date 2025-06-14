#' @docType data
#'
#' @name species
#'
#' @title Species
#'
#' @description Aquatic species and taxonomic groups, defined by FAO (2025).
#'
#' @usage
#' species
#'
#' @format
#' Data frame containing ten columns:
#' \tabular{ll}{
#'   \code{species}      \tab species code\cr
#'   \code{species_name} \tab species name\cr
#'   \code{scientific}   \tab scientific name\cr
#'   \code{isscaap}      \tab ISSCAAP group\cr
#'   \code{major}        \tab major taxa\cr
#'   \code{cpc_class}    \tab CPC class\cr
#'   \code{cpc_group}    \tab CPC group\cr
#'   \code{yearbook}     \tab yearbook category\cr
#'   \code{author}       \tab author of scientific name\cr
#'   \code{taxonomic}    \tab taxonomic code
#' }
#'
#' @details
#' This data frame contains the full set of 13,596 data records from the
#' FishStat \emph{Species Groups} data table. Column names have been simplified
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
#' head(species, 3)
#'
#' # Select species entries that have non-zero production
#' nonzero <- unique(production$species[production$value > 0])
#' species.nz <- species[species$species %in% nonzero,]
#' length(species.nz$species)
#'
#' # Only species, scientific, major, and taxonomic are always defined
#' cbind(sapply(species, function(x) all(x != "")))
#'
#' # Plus isscaap and yearbook for non-zero production
#' cbind(sapply(species.nz, function(x) all(x != "")))
#'
#' # A variety of species are missing species_name, cpc_class, cpc_group
#' cbind(table(species.nz$major[species.nz$species_name == ""]))
#' cbind(table(species.nz$major[species.nz$cpc_class == ""]))
#' cbind(table(species.nz$major[species.nz$cpc_group == ""]))
#'
#' # Number of species entries that have non-zero production by major taxa
#' cbind(table(species.nz$major))
#'
#' # By yearbook categories and major taxa
#' table(species.nz$major, species.nz$yearbook)
#'
#' # Number of unique yearbook categories, major taxa, isscaap groups, etc.
#' cbind(sapply(species.nz, function(x) length(unique(x))))
#'
#' # The scientific and species_name entries are not unique
#' table(species.nz$scientific)[table(species.nz$scientific) > 1]
#' table(species.nz$species_name)[table(species.nz$species_name) > 1]
#'
#' # Examine one species
#' print.simple.list(species[species$species_name == "Atlantic cod",])
#' print.simple.list(species[species$species == "YFT",])
#'
#' # English name when available, otherwise scientific name (FishStatJ style)
#' species$species_alt <- ifelse(species$species_name != "",
#'                               species$species_name,
#'                               paste0("[", species$scientific, "]"))
#' species[grep("Hoplias", species$scientific),
#'         c("species_name", "scientific", "species_alt")]

NA
