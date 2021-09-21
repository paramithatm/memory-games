//
//  ContentView.swift
//  memory-games
//
//  Created by Paramitha on 11/09/21.
//

import SwiftUI

struct ContentView: View {
    var items: [GridItem] = Array.init(repeating: GridItem(.flexible(minimum: 80, maximum: 150), spacing: 20), count: 2)
    
    struct Heart: Identifiable {
        let id = UUID()
        let heart: String
        var isOpen: Bool = false
    }
    
    var s: [Heart] = Array.init(repeating: Heart(heart: "asdf"), count: 12)
    
    @State var count = 0
    
    func handleCounter() {
        s = s.map { h -> Heart in
            return Heart(heart: h.heart, isOpen: true)
        }
    }
    
    var hearts = ["❤️", "🧡", "💛", "💚", "💙", "💜", "❤️", "🧡", "💛", "💚", "💙", "💜"].map { heart in
        Heart(heart: heart)
    }.shuffled()

    
    var body: some View {
        
        CardView(countt: $count)
        
//        LazyVGrid(
//            columns: items,
//            spacing: 24) {
//            ForEach(hearts, id: \.id) { thing in
//                CardView(text: thing.heart, count: count)
//            }
//        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View {
    
//    @State var isOpen: Bool = false
//    var text: String
    
    @Binding var countt: Int
    
    
//    init(text: String, count: Int) {
//        self.text = text
//        self.countt = count
//    }
    
    var body: some View {
        
        Text("\(countt)")
            .onTapGesture {
                countt += 1
            }
        
//        Text(isOpen ? text : "")
//            .font(.system(size: 30))
//            .frame(width: 150, height: 100)
//            .background(Color.gray)
//            .cornerRadius(15)
//            .onTapGesture {
//                isOpen = !isOpen
//            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


struct PlayButton: View {
    @Binding var isPlaying: Bool

    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
    }
}

struct PlayerView: View {
    var episode: String
    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text(episode)
            PlayButton(isPlaying: $isPlaying)
        }
    }
}
