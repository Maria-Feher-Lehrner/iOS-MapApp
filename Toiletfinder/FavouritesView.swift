//
//  FavouritesView.swift
//  Toiletfinder
//
//  Created by user on 03.06.24.
//

import SwiftUI

struct FavouritesView: View {
        @EnvironmentObject var favouritesManager: FavouritesManager

    var body: some View {
            NavigationView {
                List(favouritesManager.favourites, id: \.id) { item in
                    NavigationLink(destination: MapView(toilet: item)) {
                        ItemRowView(district: item.district, address: item.address)
                            .swipeActions{
                                Button(role: .destructive){
                                    favouritesManager.remove(item)
                                } label: {
                                    Label("Löschen", systemImage: "trash")
                                }
                            }
                    }
                }
                .navigationTitle(Text("Favoriten"))
            }
        }
}

/*struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}*/
