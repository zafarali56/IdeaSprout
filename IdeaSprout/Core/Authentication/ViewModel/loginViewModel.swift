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
    
    func checkEmailExists() async throws -> Bool{
        return false
    }
}
