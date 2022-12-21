//
//  EventDetailButtonView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by 麻生 拓弥 on 2020/04/18.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EventDetailButtonView: View {

    let eventUrl: String

    var body: some View {
        if #available(iOS 14.0, *) {
            return AnyView(EventLinkView(eventUrl: self.eventUrl))
        } else {
            return AnyView(EventLinkButton(eventUrl: self.eventUrl))
        }
    }
}

/// iOS 14 で Link を使って Safari を開くボタン
@available(iOS 14.0, *)
struct EventLinkView: View {
    var eventUrl: String
    var body: some View {
        Link(destination: URL(string: self.eventUrl)!) {
            EventDetailButtonTitleView()
        }.padding(20.0)
    }
}

/// iOS 13 で SafariVC を開くボタン
struct EventLinkButton: View {
    var eventUrl: String
    @State private var showModal = false
    var body: some View {
        Button(action: {
            self.showModal.toggle()
        }) {
            EventDetailButtonTitleView()
        }
        .sheet(isPresented: $showModal) {
            SafariView(url: URL(string: self.eventUrl))
                .edgesIgnoringSafeArea(.bottom)
        }.padding(20.0)
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
