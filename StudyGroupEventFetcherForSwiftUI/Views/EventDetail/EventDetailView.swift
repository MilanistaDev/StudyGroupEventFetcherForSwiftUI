//
//  EventDetailView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/05.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {

    @State private var showModal = false
    var eventData: Event    // From ListView(静的モデル)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MapView Part
                MapView(eventData: self.eventData)
                    .frame(height: 300.0)
                // Event detail part
                EventDetailPartView(eventData: self.eventData)
                // Bottom button
                Button(action: {
                    self.showModal.toggle()
                }) {
                    Text("connpassのイベントページ")
                        .font(Font.body.bold())
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(5.0)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .sheet(isPresented: $showModal) {
                    SafariView(url: URL(string: self.eventData.eventUrl))
                        .edgesIgnoringSafeArea(.bottom)
                }
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
