//
//  StudyGroupEventFetcher.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/05.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

final class StudyGroupEventFetcher {

    // connpass's event search API
    private let urlLink = "https://connpass.com/api/v1/event/?keyword=YUMEMI.swift&count=100"

    func fetchEventData() async throws -> [Event] {
        let (data, response) = try await URLSession.shared.data(from: URL(string: urlLink)!)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.response
        }

        switch httpResponse.statusCode {
        case 200:
            do {
                let searchedResultData = try JSONDecoder().decode(StudyGroup.self, from: data)
                return searchedResultData.events.reversed()

            } catch {
                throw APIError.jsonDecode
            }

        default:
            throw APIError.statusCode(statusCode: httpResponse.statusCode.description)
        }
    }
}
