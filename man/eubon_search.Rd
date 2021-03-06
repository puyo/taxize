% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eubon.R
\name{eubon_search}
\alias{eubon_search}
\title{EUBON taxonomy search}
\usage{
eubon_search(
  query,
  providers = "pesi",
  searchMode = "scientificNameExact",
  addSynonymy = FALSE,
  addParentTaxon = FALSE,
  timeout = 0,
  dedup = NULL,
  limit = 20,
  page = 1,
  ...
)
}
\arguments{
\item{query}{(character) The scientific name to search for. For example:
"Bellis perennis", "Prionus" or "Bolinus brandaris". This is an exact search
so wildcard characters are not supported}

\item{providers}{(character) A list of provider id strings concatenated by
comma characters. The default : "pesi,bgbm-cdm-server[col]" will be
used if this parameter is not set. A list of all available provider ids
can be obtained from the '/capabilities' service end point. Providers can be
nested, that is a parent provider can have sub providers. If the id of the
parent provider is supplied all subproviders will be queried. The query
can also be restricted to one or more subproviders by using the following
syntax: parent-id[sub-id-1,sub-id2,...]}

\item{searchMode}{(character) Specifies the searchMode. Possible search
modes are: \code{scientificNameExact}, \code{scientificNameLike} (begins with),
\code{vernacularNameExact}, \code{vernacularNameLike}
(contains), \code{findByIdentifier}. If the a provider does not support the
chosen searchMode it will be skipped and the status message in the
tnrClientStatus will be set to 'unsupported search mode' in this case.}

\item{addSynonymy}{(logical) Indicates whether the synonymy of the accepted
taxon should be included into the response. Turning this option on may
cause an increased response time. Default: \code{FALSE}}

\item{addParentTaxon}{(logical) Indicates whether the the parent taxon of
the accepted taxon should be included into the response. Turning this option
on may cause a slightly increased response time. Default: \code{FALSE}}

\item{timeout}{(numeric) The maximum of milliseconds to wait for responses
from any of the providers. If the timeout is exceeded the service will just
return the responses that have been received so far. The default timeout is
0 ms (wait for ever)}

\item{dedup}{(character) Allows to deduplicate the results by making use of
a deduplication strategy. The deduplication is done by comparing
specific properties of the taxon:
\itemize{
\item id: compares 'taxon.identifier'
\item id_name: compares 'taxon.identifier' AND
'taxon.taxonName.scientificName'
\item name: compares 'taxon.taxonName.scientificName' Using the pure
'name' strategy is not recommended.
}}

\item{limit}{(numeric/integer) number of records to retrieve. default: 20.
This only affects the search mode \code{scientificNameLike} and
\code{vernacularNameLike}; other search modes are expected to return only one
record per check list}

\item{page}{(numeric/integer) page to retrieve. default: 1. This only
affects the search mode \code{scientificNameLike} and \code{vernacularNameLike}; other
search modes are expected to return only one record per check list}

\item{...}{Curl options passed on to \link[crul:verb-GET]{crul::verb-GET}}
}
\description{
EUBON taxonomy search
}
\examples{
\dontrun{
eubon_search("Prionus")
eubon_search("Salmo", "pesi")
eubon_search("Salmo", c("pesi", "worms"))
eubon_search("Salmo", "worms", "scientificNameLike")
eubon_search("Salmo", "worms", "scientificNameLike", limit = 3)
eubon_search("Salmo", "worms", "scientificNameLike", limit = 20, page = 2)
eubon_search("Salmo", "worms", addSynonymy = TRUE)
eubon_search("Salmo", "worms", addParentTaxon = TRUE)
}
}
\references{
\url{https://cybertaxonomy.eu/eu-bon/utis/1.3/doc.html}
}
\seealso{
Other eubon-methods: 
\code{\link{eubon_capabilities}()},
\code{\link{eubon_children}()},
\code{\link{eubon_hierarchy}()}
}
\concept{eubon-methods}
