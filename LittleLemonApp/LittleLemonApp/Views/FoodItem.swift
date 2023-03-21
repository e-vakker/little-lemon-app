//
//  FoodItem.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 21.03.2023.
//

import SwiftUI

struct FoodItem: View, Hashable {
    
    let menuItem: MenuItem
    
    var body: some View {
        HStack {
            VStack {
                Text(menuItem.nameItem)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.sectionCategories())
                    .foregroundColor(.black)
                Spacer(minLength: 10)
                Text(menuItem.descriptionItem)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.paragraphText())
                    .foregroundColor(.primaryColor1)
                    .lineLimit(2)
                Spacer(minLength: 5)
                Text(menuItem.priceItem)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
                    .monospaced()
            }
            Image(menuItem.pictureItem)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(maxWidth: 90, maxHeight: 90)
                .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
}

struct FoodItem_Previews: PreviewProvider {
    static var previews: some View {
        
        FoodItem(menuItem: MenuItem(nameItem: "Greek Salad",
                                    descriptionItem: "The famous greek salad of crispy lettuce, peppers, olives and our chic...",
                                    priceItem: "$12.99",
                                    pictureItem: "greek-salad"))
    }
}
