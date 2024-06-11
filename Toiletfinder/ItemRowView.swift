//
//  ToiletDetails.swift
//  Toiletfinder
//
//  Created by user on 27.05.24.
//

import SwiftUI

struct ItemRowView: View {
    
    var district: Int
    var address: String
    var category: String
    
    var body: some View {
        HStack{
            Image(systemName: checkSymbol(category))
                .foregroundColor(.blue)
            Text("Bezirk: \(district)")
                .font(.headline)
            Text(address)
                .font(.subheadline)
        }
    }
    
    func checkSymbol(_ category: String) -> String {
        if category.contains("barrierefrei") || category.contains("Barrierefreies") {
            return "figure.roll"
        } else {
            return "toilet.circle"
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(district: 1, address: "Rathauspark / Felderstrasse", category: "unisex 1")
    }
}
