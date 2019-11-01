//
//  StudyGroup.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/01.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

struct StudyGroup: Decodable {
    var events: [Event]
}

// Reference of API
// Event Search API
// https://connpass.com/about/api/

// Sample mock data
let mockEventsData: [Event]
    = [Event(id: 1,
             title: "YUMEMI.swift #1 ~WWDC19報告会~",
             eventUrl: "https://yumemi.connpass.com/event/131175/",
             hashTag: "yumemi_swift",
             startDate: "2019-06-24T19:00+09:00",
             address: "東京都世田谷区",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 2,
             title: "YUMEMI.swift #1 ~WWDC19報告会~ パプリックビューイング @Sapporo",
             eventUrl: "https://yumemi.connpass.com/event/135183/",
             hashTag: "yumemi_swift",
             startDate: "2019-06-24T19:00:00+09:00",
             address: "北海道札幌市中央区",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 3,
             title: "Enjoy SwiftUI vol1",
             eventUrl: "https://yumemi.connpass.com/event/139079/",
             hashTag: "yumemi_swift",
             startDate: "2019-07-31T19:00:00+09:00",
             address: "東京都世田谷区",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 4,
             title: "YUMEMI.swift #3 ~俺/私がやったiOS 13対応~",
             eventUrl: "https://yumemi.connpass.com/event/142608/",
             hashTag: "yumemi_swift",
             startDate: "2019-09-30T19:00:00+09:00",
             address: "東京都世田谷区",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 5,
             title: "Enjoy SwiftUI vol2",
             eventUrl: "https://yumemi.connpass.com/event/151594/",
             hashTag: "yumemi_swiftui",
             startDate: "2019-11-08T19:00:00+09:00",
             address: "東京都世田谷区",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 6,
             title: "YUMEMI.swift #5",
             eventUrl: "",
             hashTag: "yumemi_swift",
             startDate: "2019-11-28T19:00:00+09:00",
             address: "東京都世田谷区",
             ownerDisplayName: "株式会社ゆめみ")
]
