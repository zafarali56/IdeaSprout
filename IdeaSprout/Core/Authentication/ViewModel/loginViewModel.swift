//
//  loginViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 29/03/2025.
//

import Foundation
import Observation

@Observable
class loginViewModel{
    var email: String = ""
    var showSingInView : Bool = false
    var showAddPassword: Bool = false
    var isSecureField : Bool = true
    var password : String = ""
    var fullName: String = ""
    var birthDate: String = ""
    var isPresented : Bool = true
    func checkEmailExists() async throws -> Bool{
        return false
    }
}
