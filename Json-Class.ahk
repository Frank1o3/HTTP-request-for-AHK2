class JSON {
    parse(str) { ; Parse json data. Works
        str := LTrim(str,"[")
        str := RTrim(str,"]")
        htmlfile := ComObject('htmlfile')
        htmlfile.write('<meta http-equiv="X-UA-Compatible" content="IE=edge">')
        return htmlfile.parentWindow.JSON.parse(str)
    }

    stringify(obj) { ; Is not tested
        htmlfile := ComObject('htmlfile')
        htmlfile.write('<meta http-equiv="X-UA-Compatible" content="IE=edge">')
        return htmlfile.parentWindow.JSON.stringify(obj)
    }

    addElementToArray(jsonArrayStr, element) {  ; Is not tested or does not work
        jsonArray := this.parse(jsonArrayStr)
        jsonArray.push(element)
        return this.stringify(jsonArray)
    }
}