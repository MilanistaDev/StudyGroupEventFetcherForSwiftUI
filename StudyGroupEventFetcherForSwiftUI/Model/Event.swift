//
//  Event.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/01.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

struct Event: Decodable, Identifiable, Hashable {
    var id: Int
    var title: String
    var subTitle: String
    var eventUrl: String
    var hashTag: String
    var startDate: String
    var endDate: String
    var place: String
    var address: String
    var lat: String?
    var lon: String?
    var ownerDisplayName: String

    enum CodingKeys: String, CodingKey {
        case id = "event_id"
        case title = "title"
        case subTitle = "catch"
        case eventUrl = "event_url"
        case hashTag = "hash_tag"
        case startDate = "started_at"
        case endDate = "ended_at"
        case place = "place"
        case address = "address"
        case lat = "lat"
        case lon = "lon"
        case ownerDisplayName = "owner_display_name"
    }
}

// Reference of API
// Event Search API
// https://connpass.com/about/api/
