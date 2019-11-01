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
