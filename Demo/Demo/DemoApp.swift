//
//  DemoApp.swift
//  Demo
//
//  Created by Anbusekar Murugesan on 25/11/2021.
//

import SwiftUI

@main
struct DemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

