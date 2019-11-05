//
//  EventDetailView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/05.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {

    @State var showModal = false

    var eventData: Event    // From ListView

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image("img_yumemi_swift").scaledToFit()
                    .padding(Edge.Set.bottom, 8.0)
                Text(eventData.title)
                    .font(.headline)
                    .lineLimit(2)
                    .padding(Edge.Set.bottom, 16.0)
                Button(action: {
                    self.showModal.toggle()
                }) {
                    Text("connpassのイベントページへ")
                        .font(.subheadline)
                }
                .sheet(isPresented: $showModal) {
                    SafariView(url: URL(string: self.eventData.eventUrl))
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
            .navigationBarTitle("Event Detail")
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(eventData: mockEventsData[0])
    }
}
