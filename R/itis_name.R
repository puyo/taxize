#' Get taxonomic names for a given taxonomic name query.
#'
#' @param query TSN number (taxonomic serial number).
#' @param get The rank of the taxonomic name to get.
#' @return Taxonomic name for the searched taxon.
#' @examples \dontrun{
#' itis_name(query="Helianthus annuus", get="family")
#' }
#' @export
#' @rdname itis_name-deprecated
itis_name <- function(query = NULL, get = NULL) {
  .Deprecated("tax_name", "taxize", msg="This function is deprecated. This function has changed name to tax_name.")
}
