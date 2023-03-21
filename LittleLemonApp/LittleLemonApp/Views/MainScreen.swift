//
//  MainScreen.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 21.03.2023.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        VStack {
            Header()
            Hero()
            Menu()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
