//
//  APIError.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2022/12/21.
//  Copyright © 2022 Takuya Aso. All rights reserved.
//

import Foundation

enum APIError: Error {
    case network
    case response
    case jsonDecode
    case statusCode(statusCode: String)
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .network:
            return "Network Error"

        case .response:
            return "Response Error"

        case .jsonDecode:
            return "json convert failed in JSONDecoder"

        case .statusCode(let statusCode):
            return "Error! StatuCode: " + String(statusCode)
        }
    }
}
