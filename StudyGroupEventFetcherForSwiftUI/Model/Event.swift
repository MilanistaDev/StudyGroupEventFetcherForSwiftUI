//
//  Event.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/01.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

struct Event: Decodable, Identifiable {
    var id: Int
    var title: String
    var eventUrl: String
    var hashTag: String
    var startDate: String
    var address: String
    var ownerDisplayName: String

    enum CodingKeys: String, CodingKey {
        case id = "event_id"
        case title = "title"
        case eventUrl = "event_url"
        case hashTag = "hash_tag"
        case startDate = "started_at"
        case address = "address"
        case ownerDisplayName = "owner_display_name"
    }
}

// Reference of API
// Event Search API
// https://connpass.com/about/api/
