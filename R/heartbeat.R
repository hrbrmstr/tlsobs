#' Check for TLS Obsercatory API server online status
#'
#' @md
#' @param host if you host your own instance of the [TLS Observatory](https://github.com/mozilla/tls-observatory), either specify
#'     the _hostname_ here (not advised) or set the envrionment variable `TLS_OBSERVATORY_HOST`
#'     to the hostname (preferred). If no environment variable is set the default
#'     ("`tls-observatory.services.mozilla.com`") will be used.
#' @return `TRUE` if the server is up
#' @references <https://github.com/mozilla/tls-observatory#get-apiv1heartbeat>
#' @export
#' @examples
#' get_heartbeat()
get_heartbeat <- function(host=get_obs_host()) {
  res <- httr::GET(sprintf("https://%s/api/v1/__heartbeat__", host[1]))
  httr::stop_for_status(res)
  return(TRUE)
}
