//
//  RoomAppApp.swift
//  RoomApp
//
//  Created by Angelo Essam on 01/12/2021.
//

import SwiftUI

@main
struct RoomAppApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentCotainer.viewContext
            ContentView().environment(\.managedObjectContext, viewContext)
        }
    }
}
