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
    }
    
    
    let hearts = ["❤️", "🧡", "💛", "💚", "💙", "💜", "❤️", "🧡", "💛", "💚", "💙", "💜"].map { heart in
        Heart(heart: heart)
    }.shuffled()

    
    var body: some View {
        LazyVGrid(
            columns: items,
            spacing: 24) {
            ForEach(hearts, id: \.id) { thing in
                Text(thing.heart)
                    .font(.system(size: 30))
                    .frame(width: 150, height: 100)
                    .background(Color.gray)
                    .clipShape(Capsule())
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
