//
//  InfoBubbleView.swift
//  Toiletfinder
//
//  Created by User on 10.06.24.
//

import SwiftUI

struct InfoBubbleView: View {
    var category: String?
    var hours: String?
    var limitations: String?
    var personnel: String?
    @Binding var showBubble: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text("Kategorie: ").fontWeight(.bold)
            Text("\(category ?? "keine Information verfügbar")")
            Text("Öffnungszeiten: ").fontWeight(.bold)
            Text("\(hours ?? "keine Information verfügbar")")
            Text("Einschränkungen: ").fontWeight(.bold)
            Text("\(limitations ?? "keine Information verfügbar")").foregroundColor(colorForLimitations(limitations ?? "keine Information verfügbar"))
            Text("Personalbetreuung: ").fontWeight(.bold)
            Text("\(personnel ?? "keine Information verfügbar")")
            
            Button("Close") {
                showBubble = false
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 3)
    }
    
    func colorForLimitations(_ limitations: String) -> Color {
        if limitations != "ganzjährig ohne Einschränkungen" {
            return .red
        } else {
            return .black
        }
    }
}

/*struct InfoBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        InfoBubbleView(category: "Herren 2; Herren Nacht 1; Damen Nacht 1, Damen 4, Pissoir",
                       hours: "00:00-24:00 Uhr",
                       limitations: "ganzjährig ohne Einschränkungen",
                       personnel: "Mo-Fr: 10-18 Uhr", showBubble: true)
    }
}*/
