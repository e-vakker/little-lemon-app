//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 16.03.2023.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Onboarding().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
