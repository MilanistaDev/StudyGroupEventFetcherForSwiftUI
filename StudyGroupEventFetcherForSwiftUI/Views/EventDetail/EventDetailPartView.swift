//
//  EventDetailPartView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/12/23.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EventDetailPartView: View {
    // Event Model
    let eventData: Event!

    var body: some View {
        VStack(alignment: .leading) {
            Text(eventData.title)
                .font(.headline)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.vertical, 8.0)
            Text(eventData.subTitle)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 24.0)
            Text(eventData.place)
                .font(.headline)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 12.0)
            Text(eventData.address)
                .font(.footnote)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 24.0)
            Text(StudyGroupDateFormatter.convertNormalDateString(dateStr: eventData.startDate, isOnlyDate: false) + " ~ " + StudyGroupDateFormatter.convertNormalDateString(dateStr: eventData.endDate, isOnlyDate: true))
                .font(.subheadline)
                .padding(.bottom, 48.0)
        }
        .padding(.horizontal, 20.0)
    }
}

struct EventDetailPartView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailPartView(eventData: mockEventsData.first)
    }
}
