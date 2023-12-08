class HTTP {
    __Init() {
        this.req := ComObject('WinHttp.WinHttpRequest.5.1') ; Interface for http request
    }
    SetTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout) { ; Set the timeouts for a request
        this.req.SetTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout)
    }
    SetHeader(header, value) { ; set the header for a request
        this.req.SetRequestHeader(header, value)
    }
    OpenRequest(method,url) { ; Open the request
        this.req.Open(method, url)
    }
    SendRequest(data := "") { ; Send the request
        this.req.Send(data)
        attempts := 0
        while (this.req.Status != 200) {
            if (this.req.Status == 404) {
                throw Error("Not Found", -1)
            } else if (this.req.Status == 204 && this.req.Status != 200) {
                return
            }
            attempts++
            if (attempts > 10) {  ; change this number to adjust the maximum number of attempts
                throw Error("Maximum attempts exceeded", -1)
            }
            Sleep 100
        }
        str := this.req.ResponseText
        str := LTrim(str,"[")
        str := RTrim(str,"]")
        return str
    }
    Get(url) { ; Function for Get request. Works
        this.OpenRequest("GET",url)
        return this.SendRequest()
    }
    Post(url, data) { ; Function for Post request. Works
        this.OpenRequest("POST",url)
        this.SetHeader('content-Type', 'application/json')
        return this.SendRequest(data)
    }
    Put(url, data) { ; Function for Put request. Works
        this.OpenRequest("PUT",url)
        this.SetHeader('content-Type', 'application/json')
        return this.SendRequest(data)
    }
}