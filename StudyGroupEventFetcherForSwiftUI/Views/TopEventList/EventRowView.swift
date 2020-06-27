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
            EventLabelView(
                labelName: StudyGroupDateFormatter.convertNormalDateString(dateStr: eventData.startDate, isOnlyDate: false) + "~",
                iconName: "calendar.circle.fill",
                colorType: .multiColor)
            EventLabelView(labelName: eventData.ownerDisplayName + " 他",
                           iconName: "mappin.circle.fill",
                           colorType: .monochrome)
            EventLabelView(labelName: eventData.address,
                           iconName: "mappin.circle.fill",
                           colorType: .multiColor)
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

enum ColorType {
    case multiColor
    case monochrome
}

struct EventLabelView: View {

    var labelName: String
    var iconName: String
    var colorType: ColorType

    var body: some View {
        HStack {
            switch colorType {
            case .monochrome:
                Image(systemName: iconName)
                    .imageScale(.medium)
                    .foregroundColor(.red)
            case .multiColor:
                if #available(iOS 14.0, *) {
                    Image(systemName: iconName)
                        .renderingMode(.original)
                        .imageScale(.medium)
                } else {
                    Image(systemName: iconName)
                        .imageScale(.medium)
                        .foregroundColor(.red)
                }
            }
            Text(labelName)
                .font(.footnote)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
        }.padding(.bottom, 6.0)
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(eventData: mockEventsData[0])
    }
}
