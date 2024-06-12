//
//  ContentView.swift
//  Toiletfinder
//
//  Created by user on 27.05.24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var repository: Repository
    @EnvironmentObject var favouritesManager: FavouritesManager
        
    var body: some View {
        VStack {
            NavigationStack{
                List(repository.toiletList, id: \.id) { item in
                    NavigationLink(destination: MapView(toilet: item)) {
                        ItemRowView(district: item.district, address: item.address, category: item.category ?? "toilet.circle")
                    }
                }
                .navigationTitle(Text("WC Anlagen in Wien"))
            }
            Button(action: {repository.load()}) {
                Image(systemName: "memories")
            }
            .padding()
        }
    }
}


/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(repository: Repository())
    }
}*/
