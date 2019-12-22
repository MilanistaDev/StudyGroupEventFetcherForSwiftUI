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
             subTitle: "サブタイトル(キャッチ)",
             eventUrl: "https://yumemi.connpass.com/event/131175/",
             hashTag: "yumemi_swift",
             startDate: "2019-06-24T19:00:00+09:00",
             endDate: "2019-06-24T21:30:00+09:00",
             place: "株式会社ゆめみ",
             address: "東京都世田谷区",
             lat: "35.641587300000",
             lon: "139.669071500000",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 2,
             title: "YUMEMI.swift #1 ~WWDC19報告会~ パプリックビューイング @Sapporo",
             subTitle: "サブタイトル(キャッチ)",
             eventUrl: "https://yumemi.connpass.com/event/135183/",
             hashTag: "yumemi_swift",
             startDate: "2019-06-24T19:00:00+09:00",
             endDate: "2019-06-24T21:30:00+09:00",
             place: "株式会社ゆめみ",
             address: "北海道札幌市中央区",
             lat: "35.641587300000",
             lon: "139.669071500000",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 3,
             title: "Enjoy SwiftUI vol1",
             subTitle: "サブタイトル(キャッチ)",
             eventUrl: "https://yumemi.connpass.com/event/139079/",
             hashTag: "yumemi_swift",
             startDate: "2019-07-31T19:00:00+09:00",
             endDate: "2019-07-31T21:30:00+09:00",
             place: "株式会社ゆめみ",
             address: "東京都世田谷区",
             lat: "35.641587300000",
             lon: "139.669071500000",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 4,
             title: "YUMEMI.swift #3 ~俺/私がやったiOS 13対応~",
             subTitle: "サブタイトル(キャッチ)",
             eventUrl: "https://yumemi.connpass.com/event/142608/",
             hashTag: "yumemi_swift",
             startDate: "2019-09-30T19:00:00+09:00",
             endDate: "2019-09-30T21:30:00+09:00",
             place: "株式会社ゆめみ",
             address: "東京都世田谷区",
             lat: "35.641587300000",
             lon: "139.669071500000",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 5,
             title: "Enjoy SwiftUI vol2",
             subTitle: "サブタイトル(キャッチ)",
             eventUrl: "https://yumemi.connpass.com/event/151594/",
             hashTag: "yumemi_swiftui",
             startDate: "2019-11-08T19:00:00+09:00",
             endDate: "2019-11-08T21:30:00+09:00",
             place: "株式会社ゆめみ",
             address: "東京都世田谷区",
             lat: "35.641587300000",
             lon: "139.669071500000",
             ownerDisplayName: "株式会社ゆめみ"),
       Event(id: 6,
             title: "YUMEMI.swift #5",
             subTitle: "サブタイトル(キャッチ)",
             eventUrl: "",
             hashTag: "yumemi_swift",
             startDate: "2019-11-29T19:30:00+09:00",
             endDate: "2019-11-29T21:30:00+09:00",
             place: "株式会社ゆめみ",
             address: "東京都世田谷区",
             lat: "35.641587300000",
             lon: "139.669071500000",
             ownerDisplayName: "株式会社ゆめみ")
]
