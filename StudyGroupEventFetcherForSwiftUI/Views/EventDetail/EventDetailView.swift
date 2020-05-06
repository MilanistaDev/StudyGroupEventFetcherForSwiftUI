//
//  EventDetailView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/05.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {
    var eventData: Event    // From ListView(静的モデル)
    @State private var zoomValue = 0.01

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MapView Part
                ZStack(alignment: .bottomTrailing) {
                    MapView(eventData: self.eventData, zoomValue: $zoomValue)
                        .frame(height: 300.0)
                    EventDetailMapButtonView(zoomValue: $zoomValue)
                        .padding(.bottom, 24.0)
                        .padding(.trailing, 12.0)
                }
                // Event detail part
                EventDetailPartView(eventData: self.eventData)
                // Bottom button
                EventDetailButtonView(eventUrl: self.eventData.eventUrl)
            }
        }
        .navigationBarTitle("Event Detail", displayMode: .inline)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(eventData: mockEventsData[0])
    }
}
