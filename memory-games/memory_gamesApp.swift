//
//  memory_gamesApp.swift
//  memory-games
//
//  Created by Paramitha on 11/09/21.
//

import SwiftUI

@main
struct memory_gamesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
