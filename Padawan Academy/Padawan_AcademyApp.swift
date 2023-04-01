//
//  Padawan_AcademyApp.swift
//  Padawan Academy
//
//  Created by Tina Nguyen on 4/1/23.
//

import SwiftUI

@main
struct Padawan_AcademyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
