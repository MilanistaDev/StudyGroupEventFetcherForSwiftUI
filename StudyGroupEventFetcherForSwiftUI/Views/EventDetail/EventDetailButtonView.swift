//
//  EventDetailButtonView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by 麻生 拓弥 on 2020/04/18.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EventDetailButtonView: View {

    var eventUrl: String
    @State private var showModal = false

    var body: some View {
        Group {
            if #available(iOS 14.0, *) {
                Link(destination: URL(string: self.eventUrl)!) {
                    EventDetailButtonTitleView()
                }
            } else {
                Button(action: {
                    self.showModal.toggle()
                }) {
                    EventDetailButtonTitleView()
                }
                .sheet(isPresented: $showModal) {
                    SafariView(url: URL(string: self.eventUrl))
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
        .padding(20.0)
    }
}

struct EventDetailButtonTitleView: View {
    var body: some View {
        Text("connpassのイベントページ")
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .font(Font.body.bold())
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(5.0)
    }
}
struct EventDetailButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailButtonView(eventUrl: mockEventsData[0].eventUrl)
    }
}
