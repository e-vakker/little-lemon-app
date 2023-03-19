//
//  UserProfile.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 19.03.2023.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
            TextField("First Name", text: $firstName)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("Last Name", text: $lastName)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("e-mail", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .buttonStyle(LittleLemonButtonStyle())
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
