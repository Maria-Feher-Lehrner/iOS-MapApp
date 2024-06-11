//
//  MapView.swift
//  Toiletfinder
//
//  Created by user on 03.06.24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var mapRegion: MKCoordinateRegion
    @EnvironmentObject var favouritesManager: FavouritesManager
    var toilet: Toilet
    @State private var showBubble: Bool = false
    
    init(toilet: Toilet) {
        self.toilet = toilet
        _mapRegion = State(initialValue: MKCoordinateRegion(center: toilet.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $mapRegion, annotationItems: [toilet]){
                toilet in
                MapAnnotation(coordinate: toilet.coordinate) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.red)
                        .onTapGesture {
                            showBubble.toggle()
                        }
                }
            }
            .overlay(
                Group {
                    if showBubble {
                        InfoBubbleView(
                            category: toilet.category ?? "keine Information verfügbar",
                            hours: toilet.hours ?? "keine Information verfügbar",
                            limitations: toilet.limitations ?? "keine Information verfügbar",
                            personnel: toilet.personnel ?? "keine Information verfügbar",
                            showBubble: $showBubble
                        )
                        .offset(y: -50)
                    }
                }
            )
            
            VStack {
                if favouritesManager.contains(toilet) {
                    Button(action: {
                        favouritesManager.remove(toilet)
                    }) {
                        Text("Favorit entfernen")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(false)
                } else {
                    Button(action: {
                        favouritesManager.add(toilet)
                    }) {
                        Text("Favorit hinzufügen")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(false)
                }
            }
            .padding()
        }
        /*.onTapGesture {
            if showBubble{
                showBubble = false
            }
        }*/
    }
}

/*struct MapView_Previews: PreviewProvider {
 static var previews: some View {
 MapView()
 }
 }*/
