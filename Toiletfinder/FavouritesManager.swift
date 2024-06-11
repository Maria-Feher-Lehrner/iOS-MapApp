//
//  FavouritesManager.swift
//  Toiletfinder
//
//  Created by User on 07.06.24.
//

import Foundation

class FavouritesManager: ObservableObject {
    @Published var favourites: [Toilet] = []
    
    private let favouritesKey = "favourites"
    
    init() {
        loadFavourites()
    }
        
    func add(_ toilet: Toilet) {
        if !favourites.contains(where: { $0.id == toilet.id}) {
            favourites.append(toilet)
            saveFavourites()
        }
    }
    
    func remove(_ toilet: Toilet) {
        if let index = favourites.firstIndex(where: { $0.id == toilet.id}) {
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
    func contains(_ toilet: Toilet) -> Bool {
        return favourites.contains(where: { $0.id == toilet.id})
    }
    
    private func saveFavourites() {
        if let encoded = try? JSONEncoder().encode(favourites) {
            UserDefaults.standard.set(encoded, forKey: favouritesKey)
        }
    }
    
    private func loadFavourites() {
        if let data = UserDefaults.standard.data(forKey: favouritesKey),
           let decoded = try? JSONDecoder().decode([Toilet].self, from: data) {
            favourites = decoded
        }
    }
    
}
