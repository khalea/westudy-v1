import UIKit



var strDate = "2020-04-20"

var strTime = "16:30:00"

func convertTimeFormat(inputTime: String) -> String {
    let inFormatter = DateFormatter()
    inFormatter.dateFormat = "HH:mm:ss"
    inFormatter.locale = Locale(identifier: "en_US_POSIX")
    let date = inFormatter.date(from: inputTime)!
    
    let outFormatter = DateFormatter()
    outFormatter.dateFormat = "hh:mm a"
    outFormatter.locale = Locale(identifier: "en_US_POSIX")

    let outStr = outFormatter.string(from: date)
    
    return outStr
}


func convertDateFormat(inputDate: String) -> String {

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
    let date = dateFormatter.date(from: inputDate)

    let convertDateFormatter = DateFormatter()
    convertDateFormatter.dateFormat = "MMM dd"
    let newDate = convertDateFormatter.string(from: date!)

    return newDate
}


print(convertTimeFormat(inputTime: strTime))
