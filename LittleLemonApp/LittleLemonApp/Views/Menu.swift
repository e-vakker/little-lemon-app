//
//  HeroSection.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 18.03.2023.
//

import SwiftUI

struct Menu: View {
    
    @State var startersIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    @State var specialsIsEnabled = true
    
    @State var searchText = ""
    
    let foodItems = [MenuItem(nameItem: "Greek Salad",
                              descriptionItem: "The famous greek salad of crispy lettuce, peppers, olives and our chic...",
                              priceItem: "$12.99",
                              pictureItem: "greek-salad"),
                     MenuItem(nameItem: "Brushetta",
                              descriptionItem: "Our Brushetta is made from grilled bread that has been smeared with g...",
                              priceItem: "$16.99",
                              pictureItem: "bruschetta"),
                     MenuItem(nameItem: "Italian pasta",
                              descriptionItem: "Delicious Italian pasta with tomato sauce and meatballs...",
                              priceItem: "$18.99",
                              pictureItem: "pasta")
    ]
    
    var body: some View {
        VStack {
            Text("ORDER FOR DELIVERY!")
                .font(.sectionTitle())
                .foregroundColor(.highlightColor2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.leading)
            Spacer(minLength: 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Toggle("Starters", isOn: $startersIsEnabled)
                    Toggle("Desserts", isOn: $dessertsIsEnabled)
                    Toggle("Drinks", isOn: $drinksIsEnabled)
                    Toggle("Specials", isOn: $specialsIsEnabled)
                }
                .toggleStyle(MyToggleStyle())
                .padding(.horizontal)
            }
            TextField("search...", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            List(foodItems) { item in
                FoodItem(menuItem: item)
            }
            .listStyle(.plain)
            Spacer()
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
