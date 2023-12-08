#Include Http-Request.ahk

Handler := HTTP()
Url := "https://www.autohotkey.com/download/2.0/version.txt"

response := Handler.Get(Url) ; Makes and send the Get request and returns the get request response
MsgBox Format("Main Ahk2 version: {1}", response)