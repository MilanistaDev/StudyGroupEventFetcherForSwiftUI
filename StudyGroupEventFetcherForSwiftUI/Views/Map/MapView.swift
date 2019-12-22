//
//  MapView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/12/23.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    let eventData: Event!

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        return mapView
    }

    // Required
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let center = CLLocationCoordinate2DMake(Double(eventData.lat)!, Double(eventData.lon)!)
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: center, span: span)
        uiView.setRegion(region, animated: true)
        uiView.showsUserLocation = true
        uiView.userTrackingMode = .follow

        // Put Annotaion on event place
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "ココ！"
        annotation.subtitle = eventData.place
        uiView.addAnnotation(annotation)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(eventData: mockEventsData.first)
    }
}
