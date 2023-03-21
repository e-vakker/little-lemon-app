//
//  Home.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 19.03.2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            MainScreen()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
