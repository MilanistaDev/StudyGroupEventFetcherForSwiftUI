//
//  TopListView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/01.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct TopListView: View {
    @StateObject private var topListVM = TopListViewModel()

    var body: some View {
        NavigationStack {
            List(topListVM.eventData) { event in
                NavigationLink(value: event) {
                    EventRowView(eventData: event)
                }
            }
            .navigationDestination(for: Event.self) { event in
                EventDetailView(eventData: event)
            }
            .navigationTitle("YUMEMI.swift一覧")
            .navigationBarTitleDisplayMode(.large)
            .loading(isRefreshing: topListVM.isShowIndicator)
        }
    }
}

struct TopListView_Previews: PreviewProvider {
    static var previews: some View {
        TopListView()
    }
}
