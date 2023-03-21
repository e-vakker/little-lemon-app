//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 21.03.2023.
//

import Foundation


struct MenuItem: Hashable, Identifiable {
    var id = UUID()
    let nameItem : String
    let descriptionItem: String
    let priceItem: String
    let pictureItem: String
}
