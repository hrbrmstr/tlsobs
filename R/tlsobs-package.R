#' Tools to Work with the 'Mozilla' 'TLS' Observatory 'API'
#'
#' The Mozilla [TLS Observatory](https://observatory.mozilla.org/analyze.html) can be
#' used to compare your site against the Mozilla guidelines. You can use their service
#' or [host your own](https://github.com/mozilla/tls-observatory#getting-started). Both
#' the central service and locally hosted services have an API. Either the central service
#'  or a local service can be queried from the functions provided.
#'
#' @name tlsobs
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @importFrom tibble as_tibble
#' @importFrom httr content GET POST stop_for_status timeout
#' @import openssl
#' @importFrom jsonlite fromJSON
NULL
