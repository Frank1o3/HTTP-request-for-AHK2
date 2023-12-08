#Include Http-Request.ahk
#Include Json-Class.ahk

Handler := HTTP()
Tool := JSON()
Url := "https://testapi.devtoolsdaily.com/users?limit=1"

response := Handler.Get(Url) ; Makes and send the Get request and returns the get request response
MsgBox response

ptr := Tool.parse(response) ; Parsing the json str response to later read some values

ptr := ObjPtr(res)
MsgBox ObjFromPtr(ptr)