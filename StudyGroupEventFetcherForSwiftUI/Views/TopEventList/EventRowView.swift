//
//  EventRowView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/01.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EventRowView: View {

    let eventData: Event

    var body: some View {
        VStack(alignment: .leading) {
            Text(eventData.title)
                .bold()
                .font(.headline)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.vertical, 8.0)
            EventLabelView(
                labelName: StudyGroupDateFormatter.convertNormalDateString(dateStr: eventData.startDate, isOnlyDate: false) + "~",
                iconName: "calendar.circle.fill",
                colorType: .multiColor)
            EventLabelView(labelName: eventData.ownerDisplayName + " 他",
                           iconName: "person.fill",
                           colorType: .monochrome)
            EventLabelView(labelName: eventData.address,
                           iconName: "mappin.circle.fill",
                           colorType: .multiColor)
            HStack {
                Spacer()
                Text("#" + eventData.hashTag)
                    .foregroundColor(.blue)
                    .font(.caption)
                    .bold()
                    .padding(.horizontal, 8.0)
                    .padding(.vertical, 4.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20.0)
                            .stroke(Color.blue, lineWidth: 1.0)
                )
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
