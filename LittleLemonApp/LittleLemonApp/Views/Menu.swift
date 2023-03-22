//
//  HeroSection.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 18.03.2023.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var startersIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    @State var specialsIsEnabled = true
    
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
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
                FetchedObjects() { (dishes: [Dish]) in
                    List(dishes) { dish in
                        FoodItem(dish)
                    }
                    .listStyle(.plain)
                }
            }
        }
        .searchable(text: $searchText, prompt: "search...")
        .onAppear {
            MenuList.getMenuData(viewContext: viewContext)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
