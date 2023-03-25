//
//  viewModel.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 25.03.2023.
//

import Foundation
import Combine

public let kFirstName = "first name key"
public let kLastName = "last name key"
public let kEmail = "e-mail key"
public let kIsLoggedIn = "kIsLoggedIn"
public let kPhoneNumber = "phone number key"

public let kOrderStatuses = "order statuses key"
public let kPasswordChanges = "password changes key"
public let kSpecialOffers = "special offers key"
public let kNewsletter = "news letter key"

class ViewModel: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Published var phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
    
    @Published var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
    @Published var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
    @Published var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @Published var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    
    
    @Published var errorMessageShow = false
    @Published var errorMessage = ""
    
    @Published var searchText = ""
    
    func validateUserInput(firstName: String, lastName: String, email: String, phoneNumber: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are required"
            errorMessageShow = true
            return false
        }
        
        guard email.contains("@") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        let email = email.split(separator: "@")
        
        guard email.count == 2 else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        guard email[1].contains(".") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        guard phoneNumber.first == "+" && phoneNumber.dropFirst().allSatisfy({$0.isNumber}) || phoneNumber.isEmpty else {
            errorMessage = "Invalid phone number format."
            errorMessageShow = true
            return false
        }
        errorMessageShow = false
        errorMessage = ""
        return true
    }
}
