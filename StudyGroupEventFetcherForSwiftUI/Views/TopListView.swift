//
//  TopListView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/01.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct TopListView: View {

    let eventsData: [Event] = mockEventsData

    var body: some View {
        NavigationView {
            List(eventsData) { event in
                VStack(alignment: .leading) {
                    Text(event.title)
                        .bold()
                        .font(.headline)
                        .lineLimit(2)
                        .padding(Edge.Set.top, 8.0)
                        .padding(Edge.Set.bottom, 12.0)
                    HStack {
                        Text("🗓").font(.footnote)
                        Text(event.startDate).font(.footnote)
                    }.padding(Edge.Set.bottom, 6.0)
                    HStack {
                        Text("👤").font(.footnote)
                        Text(event.ownerDisplayName + " 他").font(.footnote)
                    }.padding(Edge.Set.bottom, 6.0)
                    HStack {
                        Text("📍").font(.footnote)
                        Text(event.address)
                            .font(.footnote)
                            .lineLimit(3)
                    }.padding(Edge.Set.bottom, 4.0)
                    HStack {
                        Spacer()
                        Text("#" + event.hashTag)
                            .foregroundColor(.blue)
                            .font(.caption)
                            .padding(Edge.Set.bottom, 8.0)
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
