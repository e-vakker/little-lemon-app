//
//  Hero.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 19.03.2023.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Little Lemon")
                .foregroundColor(Color.primaryColor2)
                .font(.displayFont())
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                VStack {
                    Text("Chicago")
                        .foregroundColor(.white)
                        .font(.subTitleFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("""
                     We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                     """)
                    .foregroundColor(.white)
                    .font(.leadText())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }
                Image("hero-image")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 140)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
        }
        .padding()
        .background(Color.primaryColor1)
        .frame(maxWidth: .infinity, maxHeight: 200)
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
    }
}
