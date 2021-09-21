//
//  GameView.swift
//  memory-games
//
//  Created by Paramitha on 14/09/21.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        Text("hi ;)")
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
