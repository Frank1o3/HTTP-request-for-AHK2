class HTTP {
    __Init() {
        this.req := ComObject('WinHttp.WinHttpRequest.5.1')
    }
    SetTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout) {
        this.req.SetTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout)
    }
    SetHeader(header, value) {
        this.req.SetRequestHeader(header, value)
    }
    OpenRequest(method,url) {
        this.req.Open(method, url)
    }
    SendRequest(data := "") {
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
        return this.req.ResponseText
    }
    Get(url) {
        this.OpenRequest("GET",url)
        return this.SendRequest()
    }
    Post(url, data) {
        this.OpenRequest("POST",url)
        this.SetHeader('content-Type', 'application/json')
        return this.SendRequest(data)
    }
    Put(url, data) {
        this.OpenRequest("PUT",url)
        this.SetHeader('content-Type', 'application/json')
        return this.SendRequest(data)
    }
}