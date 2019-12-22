//
//  EventDetailView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/11/05.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI
import MapKit

struct EventDetailView: View {

    @State var showModal = false

    var eventData: Event    // From ListView

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                MapView().frame(height: 250)
                Text(eventData.title)
                    .font(.headline)
                    .lineLimit(2)
                    .padding(Edge.Set.bottom, 16.0)
                Button(action: {
                    self.showModal.toggle()
                }) {
                    Text("connpassのイベントページへ")
                        .font(.subheadline)
                }
                .sheet(isPresented: $showModal) {
                    SafariView(url: URL(string: self.eventData.eventUrl))
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
        .navigationBarTitle("Event Detail", displayMode: .inline)
    }
}

struct MapView: UIViewRepresentable {

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        let center = CLLocationCoordinate2DMake(35.641587300000, 139.669071500000)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    // Required
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(eventData: mockEventsData[0])
    }
}
