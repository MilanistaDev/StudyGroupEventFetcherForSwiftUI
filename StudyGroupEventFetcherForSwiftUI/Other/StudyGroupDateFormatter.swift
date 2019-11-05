//
//  StudyGroupDateFormatter.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/05.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

final class StudyGroupDateFormatter: DateFormatter {

    class func convertNormalDateString(dateStr: String) -> String {
        let formatter = ISO8601DateFormatter()
        let date = formatter.date(from: dateStr)
        return convertDateToString(date: date!)
    }

    class func convertDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: date)
    }
}
