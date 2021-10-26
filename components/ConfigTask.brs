sub init()
    m.top.functionName = "requestConfig"
end sub

sub requestConfig()
    config = parseJson(readAsciiFile("pkg:/config/app.json"))

    port = createObject("roMessagePort")
    httpTransfer = createObject("roURLTransfer")
    httpTransfer.setPort(port)
    httpTransfer.setURL("https://raw.githubusercontent.com/brbergami/ott_roku_sample_proj/main/config/app.json")
    httpTransfer.setCertificatesFile("common:/certs/ca-bundle.crt")
    httpTransfer.initClientCertificates()

    if httpTransfer.asyncGetToString()
        httpResponse = wait(2000, port)
        if type(httpResponse) = "roUrlEvent" AND httpResponse.getResponseCode() >= 200 AND httpResponse.getResponseCode() < 300
            config = parseJson(httpResponse.getString())
        end if
    end if

    m.top.response = config
end sub
