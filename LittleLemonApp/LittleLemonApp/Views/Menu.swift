//
//  HeroSection.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 18.03.2023.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var startersIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    @State var specialsIsEnabled = true
    
    @State var searchText = ""
    
    init() {
        UITextField.appearance().clearButtonMode = .always
    }
    
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
                TextField("Search menu", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                FetchedObjects(predicate: buildPredicate(),
                               sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List(dishes) { dish in
                        FoodItem(dish)
                    }
                    .listStyle(.plain)
                }
            }
        }
        .onAppear {
            MenuList.getMenuData(viewContext: viewContext)
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                  ascending: true,
                                  selector:
                                    #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        return searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
