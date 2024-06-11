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
    
    var body: some View {
        HStack{
            Text("Bezirk: \(district)")
                .font(.headline)
            Text(address)
                .font(.subheadline)
        }
    }    
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(district: 1, address: "Rathauspark / Felderstrasse")
    }
}
