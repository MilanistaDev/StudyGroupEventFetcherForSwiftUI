//
//  TopListViewModel.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/05.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

class TopListViewModel: ObservableObject {
    let fetcher = StudyGroupEventFetcher()
    @Published var eventData: [Event] = []

    init() {
        self.fetcher.fetchEventData { (events) in
            self.eventData = events
        }
    }
}
