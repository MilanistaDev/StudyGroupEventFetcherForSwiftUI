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

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MapView Part
                ZStack(alignment: .bottomTrailing) {
                    MapView(eventData: self.eventData)
                        .frame(height: 300.0)
                    VStack {
                        Button(action: {
                            // マップ拡大
                        }) {
                            Image(systemName: "plus.app.fill")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(.gray)
                        }
                        Button(action: {
                            // マップ縮小
                        }) {
                            Image(systemName: "minus.square.fill")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(.gray)
                        }
                    }
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
