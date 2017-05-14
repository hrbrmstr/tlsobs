# $ curl -X POST 'https://tls-observatory.services.mozilla.com/api/v1/scan?target=ulfr.io&rescan=true'
# https://github.com/mozilla/tls-observatory#post-apiv1scan

# Schedule a scan of a given target.
#
# @md
# @param target the FQDN of the target site. eg. `google.com`. Do not use protocol handlers or query strings.
# @param rescan if `TRUE` asks for a rescan of the `target`
#
# @param host if you host your own instance of the [TLS Observatory](https://github.com/mozilla/tls-observatory), either specify
#     the _hostname_ here (not advised) or set the envrionment variable `TLS_OBSERVATORY_HOST`
#     to the hostname (preferred). If no environment variable is set the default
#     ("`tls-observatory.services.mozilla.com`") will be used.
# @param timeout defaults to `60`, but most calls to this API enpoint come back quickly.
#     Adjust as necessary (ie. when the server is under load this might need to be increased).
# @return a `list` containing the scan results and the ID of the end-entity certificate.
# @references <https://github.com/mozilla/tls-observatory#post-apiv1scan>
# @export
# @examples
# str(get_scan_results("12302333"))
