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
                .fixedSize(horizontal: false, vertical: true)
                .padding(.vertical, 8.0)
            HStack {
                if #available(iOS 14.0, *) {
                    Image(systemName: "calendar.circle.fill")
                        .renderingMode(.original)
                        .imageScale(.medium)
                } else {
                    Image(systemName: "calendar")
                        .imageScale(.medium)
                        .foregroundColor(.red)
                }
                Text(StudyGroupDateFormatter.convertNormalDateString(dateStr: eventData.startDate, isOnlyDate: false) + "~").font(.footnote)
            }
            HStack {
                Image(systemName: "person.fill")
                    .imageScale(.medium)
                    .foregroundColor(.red)
                Text(eventData.ownerDisplayName + " 他").font(.footnote)
            }.padding(.vertical, 6.0)
            HStack {
                if #available(iOS 14.0, *) {
                    Image(systemName: "mappin.circle.fill")
                        .renderingMode(.original)
                        .imageScale(.medium)
                } else {
                    Image(systemName: "mappin.and.ellipse")
                        .imageScale(.medium)
                        .foregroundColor(.red)
                }
                Text(eventData.address)
                    .font(.footnote)
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
            }.padding(.bottom, 4.0)
            HStack {
                Spacer()
                Text("#" + eventData.hashTag)
                    .foregroundColor(.blue)
                    .font(.caption)
            }
            .padding(.bottom, 8.0)
        }
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(eventData: mockEventsData[0])
    }
}
