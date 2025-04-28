//
//  loginViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 29/03/2025.
//

import SwiftUI
import Observation

@Observable
class loginViewModel{
    var gender: String = ""
    var email: String = ""
    var showSingInView : Bool = false
    var showAddPassword: Bool = false
    var isSecureField : Bool = true
    var password : String = ""
    var fullName: String = ""
    var birthDate: String = ""
    var isPresented : Bool = true
    var selectedDate :Date = Date()
    var tempDate : Date = Date()
    let calender = Calendar.current
    let month = Calendar.current.shortMonthSymbols
    var isNavigationActive : Bool = false
    var country: String = "Pakistan"
    var showCountryList : Bool = false
    var interest: [interests] = [
        interests(id: UUID().uuidString, itemName: "Anime", imageName: "anime", isSelected: false),
        interests(id: UUID().uuidString, itemName: "Anime", imageName: "anime", isSelected: false),
        interests(id: UUID().uuidString, itemName: "Anime", imageName: "anime", isSelected: false),
        interests(id: UUID().uuidString, itemName: "Anime", imageName: "anime", isSelected: false),
        interests(id: UUID().uuidString, itemName: "Anime", imageName: "anime", isSelected: false),
        interests(id: UUID().uuidString, itemName: "Anime", imageName: "anime", isSelected: false)
    ]
    
    let gridItems: [GridItem] = [
         
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
     ]
    var isSelectedInterests: [interests] = []
   
    
    var availableYears : [Int] {
        Array((1900...2025)).reversed()
    }
    func checkEmailExists() async throws -> Bool{
		return await AuthService.shared.checkIfEmailExists(email: email)
    }
   
    func dayComponent (day: Int)-> Date{
        calender.date(from: DateComponents(
            year: calender.component(.year, from: tempDate),
            month: calender.component(.month, from: tempDate),
            day:day)) ?? Date()
    }
    
    func monthComponent (month: Int)-> Date{
        calender.date(from: DateComponents(
            year: calender.component(.year, from: tempDate),
            month: month,
            day:calender.component(.day, from: tempDate))) ?? Date()
    }
    
    func yearComponent (year: Int)-> Date{
        calender.date(from: DateComponents(
            year: year,
            month: calender.component(.month, from: tempDate),
            day:calender.component(.day, from: tempDate))) ?? Date()
    }
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, name: fullName, gender: gender, birthDate: birthDate, selectedInterests: isSelectedInterests)
    }
}
