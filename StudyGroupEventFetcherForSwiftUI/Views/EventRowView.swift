//
//  EventRowView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/01.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EventRowView: View {

    var eventData: Event

    var body: some View {
        VStack(alignment: .leading) {
            Text(eventData.title)
                .bold()
                .font(.headline)
                .lineLimit(2)
                .padding(Edge.Set.top, 8.0)
                .padding(Edge.Set.bottom, 12.0)
            HStack {
                Text("🗓").font(.footnote)
                Text(StudyGroupDateFormatter.convertNormalDateString(dateStr: eventData.startDate)).font(.footnote)
            }.padding(Edge.Set.bottom, 6.0)
            HStack {
                Text("👤").font(.footnote)
                Text(eventData.ownerDisplayName + " 他").font(.footnote)
            }.padding(Edge.Set.bottom, 6.0)
            HStack {
                Text("📍").font(.footnote)
                Text(eventData.address)
                    .font(.footnote)
                    .lineLimit(3)
            }.padding(Edge.Set.bottom, 4.0)
            HStack {
                Spacer()
                Text("#" + eventData.hashTag)
                    .foregroundColor(.blue)
                    .font(.caption)
                    .padding(Edge.Set.bottom, 8.0)
            }
        }
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(eventData: mockEventsData[0])
    }
}
