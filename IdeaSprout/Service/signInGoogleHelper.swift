//
//  singInGoogleHelper.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 29/04/2025.
//

import Foundation
import GoogleSignIn

final class signInGoogleHelper{
	@MainActor
	func signIn () async throws -> GoogleSigninResultModel{
		guard let topVC = Utilites.shared.topViewController() else {throw URLError(.badServerResponse)}
		let gIdSignIn = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
		guard let idToken : String = gIdSignIn.user.idToken?.tokenString else{throw URLError(.badServerResponse)}
		let accessToken : String = gIdSignIn.user.accessToken.tokenString
		let email : String = gIdSignIn.user.profile?.email ?? ""
		let token = GoogleSigninResultModel(idToken: idToken, accessToken: accessToken, email: email)
		return token
	}
}
