//
//  MyConfig.swift
//  DrawableExample
//
//  Created by Alap Soni on 02/10/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

class DateTimeFormat {
    
    static let shared = DateTimeFormat()
    
    let dateFormat1 = "yyyy-MM-dd"
    let dateFormat2 = "yyyy-MM-dd HH:mm:ss"
    let dateFormat3 = "d-MMM-yy hh:mm a"
    let dateFormat4 = "d-MMM-yy, hh:mm a"
    let dateFormat5 = "d-MMM-yyyy, hh:mm a"
    let dateFormat6 = "d-MMM-yyyy"
    let dateFormat7 = "dd MMM-yyyy"
    let dateFormat8 = "MMM dd"
    let dateFormat9 = "d MMM yy"
    let dateFormat10 = "yyyy-MM-dd'T'HH:mm:ss"
    let dateFormat11 = "EEE, d-MMM-yy hh:mm a"
    let dateFormat12 = "dd-MM-yyyy"
    let timeFormat1 = "hh:mm aa"
    let timeFormat2 = "HH:mm:ss"
    let timeFormat3 = "HH:mm"
    var fdate: String = ""
    let dayFormat1 = "ccc"
    
    
    func convertDate(date: String, dateFromFormat: String, dateToFormat: String) -> String {
        fdate = ""
        if !date.isEmpty && date != "0000-00-00"{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFromFormat
        let dt: Date = dateFormatter.date(from: date)!
        dateFormatter.dateFormat = dateToFormat
        fdate = dateFormatter.string(from: dt)
        return fdate
       }
        return fdate
    }
    
    func convertDate(date: Date, dateFormat: String) -> String {
        fdate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        fdate = dateFormatter.string(from: date)
        
        return fdate
    }
    
    func convertDate(date: String, dateFormat: String) -> Date {
        //fdate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let fdate = dateFormatter.date(from: date)
        
        return fdate!
    }
    
    func convertTime(time: String, timeFromFormat: String, timeToFormat: String) -> String {
        let ftime = ""
        if !time.isEmpty {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = timeFromFormat
            let dt: Date = dateFormatter.date(from: time)!
            dateFormatter.dateFormat = timeToFormat
            fdate = dateFormatter.string(from: dt)
            return fdate
        }
        return ftime
    }
    
    func convertTime(date: String) -> String {
        fdate = ""
        if !date.isEmpty{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = timeFormat3
            let dt: Date = dateFormatter.date(from: date)!
            dateFormatter.dateFormat = timeFormat1
            fdate = dateFormatter.string(from: dt)
        }
        return fdate
    }
    
    func getDay(date: Date) -> String {
        fdate = ""
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dayFormat1
            fdate = dateFormatter.string(from: date)
        
        return fdate
    }
    
    func getDate(date: Date) -> String {
        fdate = ""
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat1
            fdate = dateFormatter.string(from: date)
        
        return fdate
    }
    
    func getYear(date: Date) -> String {
        fdate = ""
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            fdate = dateFormatter.string(from: date)
        
        return fdate
    }
    
    func findTimeDiff(time1Str: String, time2Str: String) -> Int {
        let timeformatter = DateFormatter()
        timeformatter.dateFormat = "HH:mm"

        guard let time1 = timeformatter.date(from: time1Str),
            let time2 = timeformatter.date(from: time2Str) else { return 0 }

        //You can directly use from here if you have two dates

        let interval = time2.timeIntervalSince(time1)
       // let hour = interval / 3600;
        //let minute = interval.truncatingRemainder(dividingBy: 3600) / 60
        let intervalInt = Int(interval)
        return intervalInt
        //return "\(intervalInt < 0 ? "-" : "+") \(Int(hour)) Hours \(Int(minute)) Minutes"
    }
    
   /* dateFormatter.dateFormat = "yyyy"
    let year: String = dateFormatter.string(from: date)
    dateFormatter.dateFormat = "MMM"
    let month: String = dateFormatter.string(from: date)
    dateFormatter.dateFormat = "dd"
    let day: String = dateFormatter.string(from: date)*/
    
    func timeInterval(timeAgo:String) -> String
    {
        if timeAgo.isEmpty || timeAgo == "0000-00-00 00:00:00"{
            return ""
        }
        
        let dateFormat = "yyyy-MM-dd HH:mm:ss"
        let df = DateFormatter()

        df.dateFormat = dateFormat
        let dateWithTime = df.date(from: timeAgo)

        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateWithTime!, to: Date())

        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" : "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" : "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day ago" : "\(day)" + " " + "days ago"
        }else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "\(hour)" + " " + "hour ago" : "\(hour)" + " " + "hours ago"
        }else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? "\(minute)" + " " + "minute ago" : "\(minute)" + " " + "minutes ago"
        }else if let second = interval.second, second > 0 {
            return second == 1 ? "\(second)" + " " + "second ago" : "\(second)" + " " + "seconds ago"
        } else {
            return "a moment ago"
        }
    }
    
    func timeIntervalForNoti(timeAgo:String) -> String
    {
        if timeAgo.isEmpty || timeAgo == "0000-00-00 00:00:00"{
            return ""
        }
        
        let dateFormat = dateFormat5
        let df = DateFormatter()

        df.dateFormat = dateFormat
        let dateWithTime = df.date(from: timeAgo)

        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateWithTime!, to: Date())

        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" : "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" : "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day ago" : "\(day)" + " " + "days ago"
        }else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "\(hour)" + " " + "hour ago" : "\(hour)" + " " + "hours ago"
        }else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? "\(minute)" + " " + "minute ago" : "\(minute)" + " " + "minutes ago"
        }else if let second = interval.second, second > 0 {
            return second == 1 ? "\(second)" + " " + "second ago" : "\(second)" + " " + "seconds ago"
        } else {
            return "a moment ago"
        }
    }
    
}	

