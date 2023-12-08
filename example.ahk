#Include Http-Request.ahk
#Include Json-Class.ahk

Handler := HTTP()
Tool := JSON()
Url := "https://testapi.devtoolsdaily.com/users?limit=1"

response := Handler.Get(Url) ; Makes and send the Get request and returns the get request response
MsgBox response

res := Tool.parse(response)

MsgBox res.id