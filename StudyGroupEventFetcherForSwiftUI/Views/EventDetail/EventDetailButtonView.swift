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
        Button(action: {
            self.showModal.toggle()
        }) {
            Text("connpassのイベントページ")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .font(Font.body.bold())
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(5.0)
        }
        .padding(20.0)
        .sheet(isPresented: $showModal) {
            SafariView(url: URL(string: self.eventUrl))
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct EventDetailButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailButtonView(eventUrl: mockEventsData[0].eventUrl)
    }
}
