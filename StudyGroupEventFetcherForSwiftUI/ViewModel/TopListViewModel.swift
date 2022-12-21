//
//  TopListViewModel.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/05.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

final class TopListViewModel: ObservableObject {
    @Published var eventData: [Event] = []
    @Published var isShowIndicator = false
    @Published var error: Error?

    private let fetcher = StudyGroupEventFetcher()

    /// 勉強会データをAPIを叩いて取得(async/await版)
    func fetchEventData() {
        Task { @MainActor in
            isShowIndicator = true
            defer {
                isShowIndicator = false
            }
            try? await Task.sleep(nanoseconds: 1_000_000_000)

            do {
                eventData = try await fetcher.fetchEventData()

            } catch {
                self.error = error
            }
        }
    }
}
