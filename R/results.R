#' Retrieve a certificate
#'
#' @md
#' @param id the ID of the certificate to start the path at
#' @param host if you host your own instance of the [TLS Observatory](https://github.com/mozilla/tls-observatory), either specify
#'     the _hostname_ here (not advised) or set the envrionment variable `TLS_OBSERVATORY_HOST`
#'     to the hostname (preferred). If no environment variable is set the default
#'     ("`tls-observatory.services.mozilla.com`") will be used.
#' @param timeout defaults to `60`, but most calls to this API enpoint come back quickly.
#'     Adjust as necessary (ie. when the server is under load this might need to be increased).
#' @return a `list` containing the scan results and the ID of the end-entity certificate.
#' @references <https://github.com/mozilla/tls-observatory#get-apiv1results>
#' @export
#' @examples
#' str(get_scan_results("12302333"))
get_scan_results <- function(id, sha256, host=get_obs_host(), timeout=60) {

  q <- list(format="json")
  q <-  c(id = id, q)

  res <- httr::GET(sprintf("https://%s/api/v1/results", host[1]),
                   query = q,
                   timeout(timeout))
  httr::stop_for_status(res)
  res <- httr::content(res, as="text", encoding="UTF-8")
  res <- jsonlite::fromJSON(res)
  res
}


