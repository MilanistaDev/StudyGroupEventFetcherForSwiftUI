//
//  StudyGroupEventFetcher.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/05.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

class StudyGroupEventFetcher {

    // connpass's event search API
    private let urlLink = "https://connpass.com/api/v1/event/?keyword=YUMEMI.swift&count=100"

    func fetchEventData(completion: @escaping ([Event]) -> Void) {
        URLSession.shared.dataTask(with: URL(string: urlLink)!) { (data, response, error) in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let searchedResultData = try decoder.decode(StudyGroup.self, from: data)
                DispatchQueue.main.async {
                    completion(searchedResultData.events.reversed())
                }
            } catch {
                print("json convert failed in JSONDecoder. " + error.localizedDescription)
            }
        }.resume()
    }

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
