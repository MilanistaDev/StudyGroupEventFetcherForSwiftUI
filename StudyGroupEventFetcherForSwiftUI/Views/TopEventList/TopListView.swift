//
//  TopListView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/01.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct TopListView: View {

    // let eventsData: [Event] = mockEventsData
    @ObservedObject private var topListVM = TopListViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                List(topListVM.eventData) { event in
                    NavigationLink(destination: EventDetailView(eventData: event)) {
                        EventRowView(eventData: event)
                    }
                }
                if self.topListVM.isShowIndicator {
                    if #available(iOS 14.0, *) {
                        AnyView(ProgressView("Loading..."))
                    } else {
                        LoadingView()
                    }
                }
            }
            .navigationBarTitle(Text("YUMEMI.swift一覧"))
        }
    }
}

struct TopListView_Previews: PreviewProvider {
    static var previews: some View {
        TopListView()
    }
}
