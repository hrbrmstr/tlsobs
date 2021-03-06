#' Retrieve a certificate
#'
#' @md
#' @note use _either_ `id` or `sha256`. If both are provided, `id` gets preference.
#' @param id the ID of the certificate to start the path at
#' @param sha256 the hexadecimal checksum of the DER certificate (only if `id` is not provided)
#' @param host if you host your own instance of the [TLS Observatory](https://github.com/mozilla/tls-observatory), either specify
#'     the _hostname_ here (not advised) or set the envrionment variable `TLS_OBSERVATORY_HOST`
#'     to the hostname (preferred). If no environment variable is set the default
#'     ("`tls-observatory.services.mozilla.com`") will be used.
#' @param timeout defaults to `60`, but most calls to this API enpoint come back quickly.
#'     Adjust as necessary (ie. when the server is under load this might need to be increased).
#' @return a `list` containing the parsed certificate and its raw X509 version encoded with base64
#'     alog with an X509 certificate object created using `openssl`.
#' @references <https://github.com/mozilla/tls-observatory#get-apiv1certificate>
#' @export
#' @examples
#' str(get_cert(1))
get_cert <- function(id, sha256, host=get_obs_host(), timeout=60) {

  q <- list(format="json")

  if (missing(id) && missing(sha256)) stop("One of `id` or `sha256` must be provided", call.=FALSE)
  q <- if (!missing(id)) c(id = id, q) else c(sha256 = sha256, q)

  res <- httr::GET(sprintf("https://%s/api/v1/certificate", host[1]),
                   query = q,
                   timeout(timeout))
  httr::stop_for_status(res)
  res <- httr::content(res, as="text", encoding="UTF-8")
  res <- jsonlite::fromJSON(res)
  res$decoded <- openssl::read_cert(openssl::base64_decode(res$Raw))
}


