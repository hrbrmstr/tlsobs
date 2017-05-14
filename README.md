
`tlsobs` : Tools to Work with the 'Mozilla' 'TLS' Observatory 'API'

The Mozilla [TLS Observatory](https://observatory.mozilla.org/analyze.html) can be used to compare your site against the Mozilla guidelines. You can use their service or [host your own](https://github.com/mozilla/tls-observatory#getting-started). Both the central service and locally hosted services have an API. Either the central service or a local service can be queried from the functions provided.

The following functions are implemented:

-   `get_cert`: Retrieve a certificate
-   `get_issuer_count`: Retrieve certificate issuer count
-   `get_paths`: Retrieve paths from a certificate to one of multiple roots.
-   `get_scan_results`: Retrieve a certificate
-   `get_usage_stats`: Retrive 24 hour scan statistics from the TLS Obsercatory API
-   `get_heartbeat`: Check for TLS Obsercatory API server online status

### TODO

-   Starting a scan (<https://github.com/mozilla/tls-observatory#post-apiv1scan>)
-   Publishing a certificate (<https://github.com/mozilla/tls-observatory#post-apiv1certificate>)
-   Retrieving a trust store (<https://github.com/mozilla/tls-observatory#get-apiv1truststore>)
-   firing up a local Docker version and testing against it.

Feel free to implement any of ^^. Please file an issue if you do and ensure you update `DESCRIPTION`

### Installation

``` r
devtools::install_github("hrbrmstr/tlsobs")
```

### Usage

``` r
library(tlsobs)

# current verison
packageVersion("tlsobs")
```

    ## [1] '0.1.0'

``` r
get_heartbeat()
```

    ## [1] TRUE

``` r
str(get_cert(1))
```

    ## List of 8
    ##  $ subject    : chr "CN=A-Trust-nQual-03,OU=A-Trust-nQual-03,O=A-Trust Ges. f. Sicherheitssysteme im elektr. Datenverkehr GmbH,C=AT"
    ##  $ issuer     : chr "CN=A-Trust-nQual-03,OU=A-Trust-nQual-03,O=A-Trust Ges. f. Sicherheitssysteme im elektr. Datenverkehr GmbH,C=AT"
    ##  $ algorithm  : chr "sha1WithRSAEncryption"
    ##  $ signature  : raw [1:256] 55 d4 54 d1 ...
    ##  $ validity   : chr [1:2] "Aug 17 22:00:00 2005 GMT" "Aug 17 22:00:00 2015 GMT"
    ##  $ self_signed: logi TRUE
    ##  $ alt_names  : NULL
    ##  $ pubkey     :List of 5
    ##   ..$ type       : chr "rsa"
    ##   ..$ size       : int 2048
    ##   ..$ ssh        : chr "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtPWFuA/OQO8BBC4SAzewqo51ru27CQoT3URThoKgtUaNR8t4j8D ..."
    ##   ..$ fingerprint:Classes 'hash', 'md5'  raw [1:16] 8f e8 04 68 ...
    ##   ..$ data       :List of 2
    ##   .. ..$ e:Class 'bignum'  raw [1:3] 01 00 01
    ##   .. ..$ n:Class 'bignum'  raw [1:257] 00 ad 3d 61 ...

``` r
str(get_issuer_count(1))
```

    ## List of 2
    ##  $ issuer :List of 17
    ##   ..$ id                    : int 1
    ##   ..$ serialNumber          : chr "016C1E"
    ##   ..$ version               : int 3
    ##   ..$ signatureAlgorithm    : chr "SHA1WithRSA"
    ##   ..$ issuer                :List of 4
    ##   .. ..$ c : chr "AT"
    ##   .. ..$ o : chr "A-Trust Ges. f. Sicherheitssysteme im elektr. Datenverkehr GmbH"
    ##   .. ..$ ou: chr "A-Trust-nQual-03"
    ##   .. ..$ cn: chr "A-Trust-nQual-03"
    ##   ..$ validity              :List of 2
    ##   .. ..$ notBefore: chr "2005-08-17T22:00:00Z"
    ##   .. ..$ notAfter : chr "2015-08-17T22:00:00Z"
    ##   ..$ subject               :List of 4
    ##   .. ..$ c : chr "AT"
    ##   .. ..$ o : chr "A-Trust Ges. f. Sicherheitssysteme im elektr. Datenverkehr GmbH"
    ##   .. ..$ ou: chr "A-Trust-nQual-03"
    ##   .. ..$ cn: chr "A-Trust-nQual-03"
    ##   ..$ key                   :List of 3
    ##   .. ..$ alg     : chr "RSA"
    ##   .. ..$ size    : int 2048
    ##   .. ..$ exponent: int 65537
    ##   ..$ x509v3Extensions      :List of 7
    ##   .. ..$ authorityKeyId          : chr ""
    ##   .. ..$ subjectKeyId            : chr "RGqVZ1V5EU8="
    ##   .. ..$ keyUsage                : chr [1:2] "Certificate Sign" "CRL Sign"
    ##   .. ..$ extendedKeyUsage        : list()
    ##   .. ..$ subjectAlternativeName  : NULL
    ##   .. ..$ crlDistributionPoint    : NULL
    ##   .. ..$ isTechnicallyConstrained: logi FALSE
    ##   ..$ x509v3BasicConstraints: chr "Critical"
    ##   ..$ ca                    : logi TRUE
    ##   ..$ validationInfo        : Named list()
    ##   ..$ firstSeenTimestamp    : chr "2015-12-03T20:19:28.194925Z"
    ##   ..$ lastSeenTimestamp     : chr "2017-05-14T11:07:17.511871Z"
    ##   ..$ hashes                :List of 4
    ##   .. ..$ sha1               : chr "D3C063F219ED073E34AD5D750B327629FFD59AF2"
    ##   .. ..$ sha256             : chr "793CBF4559B9FDE38AB22DF16869F69881AE14C4B0139AC788A78A1AFCCA02FB"
    ##   .. ..$ sha256_subject_spki: chr "FA243987238B5A9F122227305F937372860BBE73E8655B6F3B55A82574758339"
    ##   .. ..$ pin-sha256         : chr "+sld48JKF0GUgAz/qjylHXEWYwZkqbYMh1i07w3Fj4g="
    ##   ..$ Raw                   : chr "MIIDzzCCAregAwIBAgIDAWweMA0GCSqGSIb3DQEBBQUAMIGNMQswCQYDVQQGEwJBVDFIMEYGA1UECgw/QS1UcnVzdCBHZXMuIGYuIFNpY2hlcmh"| __truncated__
    ##   ..$ ciscoUmbrellaRank     : int 2147483647
    ##  $ eecount: int 0

``` r
str(get_paths(1))
```

    ## List of 2
    ##  $ certificate:List of 17
    ##   ..$ id                    : int 1
    ##   ..$ serialNumber          : chr "016C1E"
    ##   ..$ version               : int 3
    ##   ..$ signatureAlgorithm    : chr "SHA1WithRSA"
    ##   ..$ issuer                :List of 4
    ##   .. ..$ c : chr "AT"
    ##   .. ..$ o : chr "A-Trust Ges. f. Sicherheitssysteme im elektr. Datenverkehr GmbH"
    ##   .. ..$ ou: chr "A-Trust-nQual-03"
    ##   .. ..$ cn: chr "A-Trust-nQual-03"
    ##   ..$ validity              :List of 2
    ##   .. ..$ notBefore: chr "2005-08-17T22:00:00Z"
    ##   .. ..$ notAfter : chr "2015-08-17T22:00:00Z"
    ##   ..$ subject               :List of 4
    ##   .. ..$ c : chr "AT"
    ##   .. ..$ o : chr "A-Trust Ges. f. Sicherheitssysteme im elektr. Datenverkehr GmbH"
    ##   .. ..$ ou: chr "A-Trust-nQual-03"
    ##   .. ..$ cn: chr "A-Trust-nQual-03"
    ##   ..$ key                   :List of 3
    ##   .. ..$ alg     : chr "RSA"
    ##   .. ..$ size    : int 2048
    ##   .. ..$ exponent: int 65537
    ##   ..$ x509v3Extensions      :List of 7
    ##   .. ..$ authorityKeyId          : chr ""
    ##   .. ..$ subjectKeyId            : chr "RGqVZ1V5EU8="
    ##   .. ..$ keyUsage                : chr [1:2] "Certificate Sign" "CRL Sign"
    ##   .. ..$ extendedKeyUsage        : list()
    ##   .. ..$ subjectAlternativeName  : NULL
    ##   .. ..$ crlDistributionPoint    : NULL
    ##   .. ..$ isTechnicallyConstrained: logi FALSE
    ##   ..$ x509v3BasicConstraints: chr "Critical"
    ##   ..$ ca                    : logi TRUE
    ##   ..$ validationInfo        : Named list()
    ##   ..$ firstSeenTimestamp    : chr "2015-12-03T20:19:28.194925Z"
    ##   ..$ lastSeenTimestamp     : chr "2017-05-14T11:07:17.511871Z"
    ##   ..$ hashes                :List of 4
    ##   .. ..$ sha1               : chr "D3C063F219ED073E34AD5D750B327629FFD59AF2"
    ##   .. ..$ sha256             : chr "793CBF4559B9FDE38AB22DF16869F69881AE14C4B0139AC788A78A1AFCCA02FB"
    ##   .. ..$ sha256_subject_spki: chr "FA243987238B5A9F122227305F937372860BBE73E8655B6F3B55A82574758339"
    ##   .. ..$ pin-sha256         : chr "+sld48JKF0GUgAz/qjylHXEWYwZkqbYMh1i07w3Fj4g="
    ##   ..$ Raw                   : chr "MIIDzzCCAregAwIBAgIDAWweMA0GCSqGSIb3DQEBBQUAMIGNMQswCQYDVQQGEwJBVDFIMEYGA1UECgw/QS1UcnVzdCBHZXMuIGYuIFNpY2hlcmh"| __truncated__
    ##   ..$ ciscoUmbrellaRank     : int 2147483647
    ##  $ parents    :'data.frame': 1 obs. of  2 variables:
    ##   ..$ certificate:'data.frame':  1 obs. of  17 variables:
    ##   .. ..$ id                    : int 265159
    ##   .. ..$ serialNumber          : chr "14B4F9"
    ##   .. ..$ version               : int 3
    ##   .. ..$ signatureAlgorithm    : chr "SHA1WithRSA"
    ##   .. ..$ issuer                :'data.frame':    1 obs. of  5 variables:
    ##   .. .. ..$ id: int 265159
    ##   .. .. ..$ c :List of 1
    ##   .. .. .. ..$ : chr "AT"
    ##   .. .. ..$ o :List of 1
    ##   .. .. .. ..$ : chr "A-Trust Ges. f. Sicherheitssysteme im elektr. Datenverkehr GmbH"
    ##   .. .. ..$ ou:List of 1
    ##   .. .. .. ..$ : chr "A-Trust-nQual-03"
    ##   .. .. ..$ cn: chr "A-Trust-nQual-03"
    ##   .. ..$ validity              :'data.frame':    1 obs. of  2 variables:
    ##   .. .. ..$ notBefore: chr "2014-07-23T10:38:29Z"
    ##   .. .. ..$ notAfter : chr "2025-07-23T08:38:29Z"
    ##   .. ..$ subject               :'data.frame':    1 obs. of  4 variables:
    ##   .. .. ..$ c :List of 1
    ##   .. .. .. ..$ : chr "AT"
    ##   .. .. ..$ o :List of 1
    ##   .. .. .. ..$ : chr "A-Trust Ges. f. Sicherheitssysteme im elektr. Datenverkehr GmbH"
    ##   .. .. ..$ ou:List of 1
    ##   .. .. .. ..$ : chr "A-Trust-nQual-03"
    ##   .. .. ..$ cn: chr "A-Trust-nQual-03"
    ##   .. ..$ key                   :'data.frame':    1 obs. of  3 variables:
    ##   .. .. ..$ alg     : chr "RSA"
    ##   .. .. ..$ size    : int 2048
    ##   .. .. ..$ exponent: int 65537
    ##   .. ..$ x509v3Extensions      :'data.frame':    1 obs. of  7 variables:
    ##   .. .. ..$ authorityKeyId          : chr ""
    ##   .. .. ..$ subjectKeyId            : chr "RGqVZ1V5EU8="
    ##   .. .. ..$ keyUsage                :List of 1
    ##   .. .. .. ..$ : chr [1:2] "Certificate Sign" "CRL Sign"
    ##   .. .. ..$ extendedKeyUsage        :List of 1
    ##   .. .. .. ..$ : list()
    ##   .. .. ..$ subjectAlternativeName  : logi NA
    ##   .. .. ..$ crlDistributionPoint    : logi NA
    ##   .. .. ..$ isTechnicallyConstrained: logi FALSE
    ##   .. ..$ x509v3BasicConstraints: chr "Critical"
    ##   .. ..$ ca                    : logi TRUE
    ##   .. ..$ validationInfo        :'data.frame':    1 obs. of  5 variables:
    ##   .. .. ..$ Android  :'data.frame':  1 obs. of  0 variables
    ##   .. .. ..$ Apple    :'data.frame':  1 obs. of  0 variables
    ##   .. .. ..$ Microsoft:'data.frame':  1 obs. of  1 variable:
    ##   .. .. .. ..$ isValid: logi TRUE
    ##   .. .. ..$ Mozilla  :'data.frame':  1 obs. of  0 variables
    ##   .. .. ..$ Ubuntu   :'data.frame':  1 obs. of  0 variables
    ##   .. ..$ firstSeenTimestamp    : chr "2015-12-06T01:40:18.587601Z"
    ##   .. ..$ lastSeenTimestamp     : chr "2017-05-14T11:20:13.02895Z"
    ##   .. ..$ hashes                :'data.frame':    1 obs. of  4 variables:
    ##   .. .. ..$ sha1               : chr "4CAEE38931D19AE73B31AA75CA33D621290FA75E"
    ##   .. .. ..$ sha256             : chr "8688E58F4C7A945FADCE7F62BFEF521B82DA7DC38BFDB0163478A5FE42E57870"
    ##   .. .. ..$ sha256_subject_spki: chr "FA243987238B5A9F122227305F937372860BBE73E8655B6F3B55A82574758339"
    ##   .. .. ..$ pin-sha256         : chr "+sld48JKF0GUgAz/qjylHXEWYwZkqbYMh1i07w3Fj4g="
    ##   .. ..$ Raw                   : chr "MIIDzzCCAregAwIBAgIDFLT5MA0GCSqGSIb3DQEBBQUAMIGNMQswCQYDVQQGEwJBVDFIMEYGA1UECgw/QS1UcnVzdCBHZXMuIGYuIFNpY2hlcmh"| __truncated__
    ##   .. ..$ ciscoUmbrellaRank     : int 2147483647
    ##   ..$ parents    : logi NA

``` r
str(get_scan_results("12302333"))
```

    ## List of 14
    ##  $ id             : int 12302333
    ##  $ timestamp      : chr "2016-09-15T16:59:51.489655Z"
    ##  $ target         : chr "ulfr.io"
    ##  $ replay         : int -1
    ##  $ has_tls        : logi TRUE
    ##  $ cert_id        : int 1759583
    ##  $ trust_id       : int 3106209
    ##  $ is_valid       : logi TRUE
    ##  $ completion_perc: int 100
    ##  $ connection_info:List of 4
    ##   ..$ scanIP        : chr "72.64.221.62"
    ##   ..$ serverside    : logi TRUE
    ##   ..$ ciphersuite   :'data.frame':   4 obs. of  9 variables:
    ##   .. ..$ cipher       : chr [1:4] "ECDHE-ECDSA-AES256-GCM-SHA384" "ECDHE-ECDSA-AES128-GCM-SHA256" "ECDHE-ECDSA-AES256-SHA384" "ECDHE-ECDSA-AES128-SHA256"
    ##   .. ..$ code         : int [1:4] 0 0 0 0
    ##   .. ..$ protocols    :List of 4
    ##   .. .. ..$ : chr "TLSv1.2"
    ##   .. .. ..$ : chr "TLSv1.2"
    ##   .. .. ..$ : chr "TLSv1.2"
    ##   .. .. ..$ : chr "TLSv1.2"
    ##   .. ..$ pubkey       : int [1:4] 256 256 256 256
    ##   .. ..$ sigalg       : chr [1:4] "sha256WithRSAEncryption" "sha256WithRSAEncryption" "sha256WithRSAEncryption" "sha256WithRSAEncryption"
    ##   .. ..$ ticket_hint  : chr [1:4] "300" "300" "300" "300"
    ##   .. ..$ ocsp_stapling: logi [1:4] TRUE TRUE TRUE TRUE
    ##   .. ..$ pfs          : chr [1:4] "ECDH,P-256,256bits" "ECDH,P-256,256bits" "ECDH,P-256,256bits" "ECDH,P-256,256bits"
    ##   .. ..$ curves       :List of 4
    ##   .. .. ..$ : chr "prime256v1"
    ##   .. .. ..$ : chr "prime256v1"
    ##   .. .. ..$ : chr "prime256v1"
    ##   .. .. ..$ : chr "prime256v1"
    ##   ..$ curvesFallback: logi FALSE
    ##  $ analysis       :'data.frame': 2 obs. of  4 variables:
    ##   ..$ id      : int [1:2] 3226423 3226422
    ##   ..$ analyzer: chr [1:2] "mozillaEvaluationWorker" "mozillaGradingWorker"
    ##   ..$ result  :'data.frame': 2 obs. of  4 variables:
    ##   .. ..$ level      : chr [1:2] "modern" NA
    ##   .. ..$ failures   :'data.frame':   2 obs. of  4 variables:
    ##   .. .. ..$ bad         : logi [1:2] NA NA
    ##   .. .. ..$ old         :List of 2
    ##   .. .. .. ..$ : chr [1:5] "sha256WithRSAEncryption is not an old certificate signature, use sha1WithRSAEncryption" "consider adding ciphers ECDHE-ECDSA-CHACHA20-POLY1305, ECDHE-RSA-CHACHA20-POLY1305, ECDHE-RSA-AES128-GCM-SHA256"| __truncated__ "add protocols TLSv1.1, TLSv1, SSLv3" "add cipher DES-CBC3-SHA for backward compatibility" ...
    ##   .. .. .. ..$ : NULL
    ##   .. .. ..$ modern      :List of 2
    ##   .. .. .. ..$ : chr "consider adding ciphers ECDHE-RSA-AES256-GCM-SHA384, ECDHE-ECDSA-CHACHA20-POLY1305, ECDHE-RSA-CHACHA20-POLY1305"| __truncated__
    ##   .. .. .. ..$ : NULL
    ##   .. .. ..$ intermediate:List of 2
    ##   .. .. .. ..$ : chr [1:3] "consider adding ciphers ECDHE-ECDSA-CHACHA20-POLY1305, ECDHE-RSA-CHACHA20-POLY1305, ECDHE-RSA-AES128-GCM-SHA256"| __truncated__ "add protocols TLSv1.1, TLSv1" "use a certificate of type rsa, not ECDSA"
    ##   .. .. .. ..$ : NULL
    ##   .. ..$ grade      : int [1:2] NA 93
    ##   .. ..$ lettergrade: chr [1:2] NA "A"
    ##   ..$ success : logi [1:2] TRUE TRUE
    ##  $ ack            : logi TRUE
    ##  $ attempts       : int 2
    ##  $ analysis_params: Named list()

``` r
get_usage_stats()
```

    ## $scans
    ## [1] 20501824
    ## 
    ## $trusts
    ## [1] 24282644
    ## 
    ## $analyses
    ## [1] 8400397
    ## 
    ## $certificates
    ## [1] 15206328
    ## 
    ## $pendingScansCount
    ## [1] 0
    ## 
    ## $last24HoursScansCount
    ## # A tibble: 25 × 2
    ##                    hour count
    ## *                 <chr> <int>
    ## 1  2017-05-14T11:00:00Z   519
    ## 2  2017-05-14T10:00:00Z  1443
    ## 3  2017-05-14T09:00:00Z  1437
    ## 4  2017-05-14T08:00:00Z  1478
    ## 5  2017-05-14T07:00:00Z  1429
    ## 6  2017-05-14T06:00:00Z  1442
    ## 7  2017-05-14T05:00:00Z  1456
    ## 8  2017-05-14T04:00:00Z  1376
    ## 9  2017-05-14T03:00:00Z  1736
    ## 10 2017-05-14T02:00:00Z  1440
    ## # ... with 15 more rows
    ## 
    ## $distinctTargetsLast24Hours
    ## [1] 34502
    ## 
    ## $distinctCertsSeenLast24Hours
    ## [1] 99757
    ## 
    ## $distinctCertsAddedLast24Hours
    ## [1] 88023

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
