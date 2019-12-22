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
    var eventData: Event!

    var body: some View {
        VStack(alignment: .leading) {
            Text(eventData.title)
                .font(.headline)
                .lineLimit(2)
                .padding([.leading, .trailing], 20.0)
                .padding([.top, .bottom], 8.0)
            Text(eventData.subTitle)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(3)
                .padding([.leading, .trailing], 20.0)
                .padding(.bottom, 24.0)
            Text(eventData.place)
                .font(.headline)
                .lineLimit(2)
                .padding([.leading, .trailing], 20.0)
                .padding(.bottom, 12.0)
            Text(eventData.address)
                .font(.footnote)
                .lineLimit(2)
                .padding([.leading, .trailing], 20.0)
                .padding(.bottom, 24.0)
            Text(StudyGroupDateFormatter.convertNormalDateString(dateStr: eventData.startDate, isOnlyDate: false) + " ~ " + StudyGroupDateFormatter.convertNormalDateString(dateStr: eventData.endDate, isOnlyDate: true))
                .font(.subheadline)
                .padding([.leading, .trailing], 20.0)
                .padding(.bottom, 48.0)
        }
    }
}

struct EventDetailPartView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailPartView(eventData: mockEventsData.first)
    }
}
