#' Retrive 24 hour scan statistics from the  TLS Obsercatory API
#'
#' @md
#' @param host if you host your own instance of the [TLS Observatory](https://github.com/mozilla/tls-observatory), either specify
#'     the _hostname_ here (not advised) or set the envrionment variable `TLS_OBSERVATORY_HOST`
#'     to the hostname (preferred). If no environment variable is set the default
#'     ("`tls-observatory.services.mozilla.com`") will be used.
#' @param timeout defaults to `60` seconds as the endpoint seems to issue a SQL query
#'     for every call vs cache data. Adjust as necessary (ie. when the server is under load
#'     this might need to be increased).
#' @return a `list` with a `data.frame` of scan counts for the past 24 hours and
#'     other metadata fields.
#' @references <https://github.com/mozilla/tls-observatory#get-apiv1stats>
#' @export
#' @examples
#' get_usage_stats()
get_usage_stats <- function(host=get_obs_host(), timeout=60) {
  res <- httr::GET(sprintf("https://%s/api/v1/__stats__", host[1]),
                   query = list(format="json"),
                   timeout(timeout))
  httr::stop_for_status(res)
  res <- httr::content(res, as="text", encoding="UTF-8")
  res <- jsonlite::fromJSON(res)
  res$last24HoursScansCount <- tibble::as_tibble(res$last24HoursScansCount)
  res
}

