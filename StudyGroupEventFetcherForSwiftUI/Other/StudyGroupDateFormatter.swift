//
//  StudyGroupDateFormatter.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/05.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

final class StudyGroupDateFormatter: DateFormatter {

    class func convertNormalDateString(dateStr: String, isOnlyDate: Bool) -> String {
        let formatter = ISO8601DateFormatter()
        let date = formatter.date(from: dateStr)
        return convertDateToString(date: date!, isOnlyDate: isOnlyDate)
    }

    class func convertDateToString(date: Date, isOnlyDate: Bool) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = isOnlyDate ? .none: .short
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: date)
    }
}
