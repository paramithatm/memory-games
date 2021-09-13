//
//  ContentView.swift
//  memory-games
//
//  Created by Paramitha on 11/09/21.
//

import MapKit
import SwiftUI

struct ContentView: View {
    var items: [GridItem] = Array.init(repeating: GridItem(.flexible(minimum: 80, maximum: 150), spacing: 20), count: 2)
    
    struct Heart: Identifiable {
        let id = UUID()
        let heart: String
        var isOpen: Bool
    }
    
    var hearts = ["❤️", "🧡", "💛", "💚", "💙", "💜", "❤️", "🧡", "💛", "💚", "💙", "💜"].map { heart in
        Heart(heart: heart, isOpen: false)
    }.shuffled()

    
    var body: some View {
        LazyVGrid(
            columns: items,
            spacing: 24) {
            ForEach(hearts, id: \.id) { thing in
                CardView(text: thing.heart)
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View {
    
    @State var isOpen: Bool = false
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(isOpen ? text : "")
            .font(.system(size: 30))
            .frame(width: 150, height: 100)
            .background(Color.gray)
            .cornerRadius(15)
            .onTapGesture {
                isOpen = !isOpen
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
