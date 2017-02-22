//
//  DateUtils.swift
//  CarelinkerEnterprise
//
//  Created by 刘 强 on 15/9/5.
//  Copyright (c) 2016年 carelinker. All rights reserved.
//

import Foundation
class DateUtils{
    
    static func getTimestamp() -> String{
        let date: Foundation.Date = Foundation.Date(timeIntervalSinceNow: 0)
        return String(Int(date.timeIntervalSince1970))
    }
    static func getTimestampSouth() -> String{
        let date: Foundation.Date = Foundation.Date(timeIntervalSinceNow: 0)
        return String(Int((date.timeIntervalSince1970)*1000))
    }
    
    static func getDate() -> String{
        let date : Foundation.Date = Foundation.Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
    }
    static func getDate2() -> String{
        let date : Foundation.Date = Foundation.Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        return dateFormatter.string(from: date)
    }
    static func getDate3() -> String{
        let date : Foundation.Date = Foundation.Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    static func getDatetime() -> String{
        let date : Foundation.Date = Foundation.Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        return dateFormatter.string(from: date)
    }
    
    static func getTime() -> String{
        let date : Foundation.Date = Foundation.Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    static func getTime2() -> String{
        let date : Foundation.Date = Foundation.Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmmss"
        return dateFormatter.string(from: date)
    }
    
    static func getDatetime(_ format: String) -> String{
        let date : Foundation.Date = Foundation.Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    static func getAgeFromBirthday(_ birthday : String) -> Int?{
        
        if(birthday.isEmpty){
            print("birthday.isEmpty")
            return nil
        }
        
        let dateFommatrer = DateFormatter()
        if birthday.contains("-") {
            dateFommatrer.dateFormat = "yyyy-MM-dd"
        }else{
            dateFommatrer.dateFormat = "yyyyMMdd"
        }
        let birthdayDate = dateFommatrer.date(from: birthday)
        let calendar : Calendar = Calendar.current
        let ageComponents = (calendar as NSCalendar).components(NSCalendar.Unit.year,
            from: birthdayDate!,
            to: Foundation.Date(),
            options: [])

        return ageComponents.year
    }
    
    static func YYYY_MM_DD2YYYYMMDD(_ date : String) ->String{
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy-MM-dd"
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyyMMdd"
        return dateFormatter2.string(from: dateFormatter1.date(from: date)!)
    }
    
    static func YYYYMMDD2YYYY_MM_DD(_ date : String) ->String{
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyyMMdd"
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd"
        return dateFormatter2.string(from: dateFormatter1.date(from: date)!)
    }
    
    
    
    static func getFirstDayOfMonth(_ dateStr: String, format: String) -> String{
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = format
        
        let date = dateFormatter1.date(from: dateStr)
        
        let calendar : Calendar = Calendar.current
        var comps = (calendar as NSCalendar).components(NSCalendar.Unit.year,
            from: date!)
        comps.day = 1
        comps.month = getMonth(date!)
        comps.year = getYear(date!)
        let firstDay = calendar.date(from: comps)
        return dateFormatter1.string(from: firstDay!)
    }
    
    
    static func getDay(_ date: Foundation.Date) -> Int{
        let calendar : Calendar = Calendar.current
        let comps = (calendar as NSCalendar).components(NSCalendar.Unit.day,
            from: date)
        return comps.day!
    }
    
    static func getMonth(_ date: Foundation.Date) -> Int{
        let calendar : Calendar = Calendar.current
        let comps = (calendar as NSCalendar).components(NSCalendar.Unit.month,
            from: date)
        return comps.month!
    }
    
    static func getYear(_ date: Foundation.Date) -> Int{
        let calendar : Calendar = Calendar.current
        let comps = (calendar as NSCalendar).components(NSCalendar.Unit.year,
            from: date)
        return comps.year!
    }
    
    static func formatDateToString(_ date: Foundation.Date, format: String) -> String{
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = format
        return dateFormatter1.string(from: date)
    }
    
    static func formatStringToDate(_ dateStr: String, format: String) -> Foundation.Date{
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = format
        return dateFormatter1.date(from: dateStr)!
    }
    
    static func formatStringToString(_ dateStr: String, from: String, to: String) -> String{
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = from
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = to
        
        return  dateFormatter2.string(from: dateFormatter1.date(from: dateStr)!)
    }
    
    static func rollNOfDate(_ date: Foundation.Date, unit: NSCalendar.Unit, num: Int) -> Foundation.Date{
        let calendar : Calendar = Calendar.current
        
        var adcomps = DateComponents()
        if unit == .day{
            adcomps.day = num
        }
        
        if unit == .month{
            adcomps.month = num
        }
        
        if unit == .year{
            adcomps.year = num
        }
        
        return (calendar as NSCalendar).date(byAdding: adcomps, to: date, options: [])!
    }
    
    static func rollNOfDate(_ dateStr: String, format: String, unit: NSCalendar.Unit, num: Int) -> String{
     
        let date = formatStringToDate(dateStr, format: format)
        
        let _date = rollNOfDate(date, unit: unit, num: num)
        
        return formatDateToString(_date, format: format)
    }
    static func getDataTimeOneSeasonAgo() -> String{
        let date : Foundation.Date = Foundation.Date(timeIntervalSinceNow: -90*3600*24)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    static func getDataTimeOneYearAgo() -> String{
        let date : Foundation.Date = Foundation.Date(timeIntervalSinceNow: -365*3600*24)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    static func getDateDisplayString(_ miliSeconds: Int64) -> String{
        let temp: TimeInterval = TimeInterval(miliSeconds)
        
        let seconds: TimeInterval = temp/1000
        let date: Foundation.Date = Foundation.Date(timeIntervalSince1970: seconds)
        
        let calendar: Calendar = Calendar.current
        
        let nowCmps: DateComponents = (calendar as NSCalendar).components(NSCalendar.Unit.day, from: Foundation.Date())
        let cmps : DateComponents = (calendar as NSCalendar).components(NSCalendar.Unit.day, from: date)
        
        let dateFmt: DateFormatter = DateFormatter()
        if(nowCmps.year != cmps.year){
            dateFmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }else{
            if(nowCmps.day == cmps.day){
                dateFmt.dateFormat = "今天 HH:mm:ss"
            }else if((nowCmps.day! - cmps.day!) == 1){
                dateFmt.dateFormat = "昨天 HH:mm:ss"
            }else{
                dateFmt.dateFormat = "MM-dd HH:mm:ss"
            }
        }
        
        return dateFmt.string(from: date)
    }

    
}
