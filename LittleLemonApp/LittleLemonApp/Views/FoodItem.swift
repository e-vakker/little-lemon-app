//
//  FoodItem.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 21.03.2023.
//

import SwiftUI

struct FoodItem: View {
    
    @ObservedObject private var dish:Dish
    
    init(_ dish:Dish) {
        self.dish = dish
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(dish.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.sectionCategories())
                    .foregroundColor(.black)
                Spacer(minLength: 10)
                Text(dish.descriptionDish ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.paragraphText())
                    .foregroundColor(.primaryColor1)
                    .lineLimit(2)
                Spacer(minLength: 5)
                Text("$" + (dish.price ?? ""))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
                    .monospaced()
            }
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
}

struct FoodItem_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    let dish = Dish(context: context)
    static var previews: some View {
        FoodItem(oneDish())
    }
    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.title = "Hummus"
        dish.descriptionDish = "Test"
        dish.price = "10"
        dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
        return dish
    }
}
