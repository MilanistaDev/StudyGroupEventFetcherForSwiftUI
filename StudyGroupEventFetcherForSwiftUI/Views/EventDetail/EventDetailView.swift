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

    @State private var showModal = false
    var eventData: Event    // From ListView(静的モデル)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MapView Part
                MapView().frame(height: 250)
                // Event detail part
                EventDetailPartView(eventData: self.eventData)
                // Bottom button
                Button(action: {
                    self.showModal.toggle()
                }) {
                    Text("connpassのイベントページ")
                        .font(Font.body.bold())
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(5.0)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
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
