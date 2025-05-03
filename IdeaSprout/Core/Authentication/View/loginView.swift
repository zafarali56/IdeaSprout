//
//  loginView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 29/03/2025.
//

import SwiftUI

struct loginView: View {
	@State private var viewModel = loginViewModel()
	
	var body: some View {
		NavigationStack {
			GeometryReader { proxy in
				ZStack {
					Color.white // Optional background
					
					VStack(spacing: 20) {
						// Top image, taking 50% of screen height
						Image("loginPic")
							.resizable()
							.scaledToFit()
							.frame(height: proxy.size.height * 0.5)
							.clipped()

						// Email text field
						TextField("Email address", text: $viewModel.email)
							.EmailModifier()
							.frame(width: proxy.size.width * 0.8)

						// Continue button
						loginButton(
							color: .red,
							width: proxy.size.width * 0.8,
							title: "Continue",
							imageName: "",
							foregroundColor: .white
						)
						.frame(width: proxy.size.width * 0.8)
						.onTapGesture {
							Task {
								if try await viewModel.checkEmailExists() {
									viewModel.showSingInView.toggle()
								} else {
									viewModel.showAddPassword.toggle()
								}
							}
						}

						// Facebook button
						loginButton(
							color: .blue,
							width: proxy.size.width * 0.8,
							title: "Continue with Facebook",
							imageName: "facebook",
							foregroundColor: .white
						)
						.frame(width: proxy.size.width * 0.8)

						// Google button
						loginButton(
							color: .gray.opacity(0.5),
							width: proxy.size.width * 0.8,
							title: "Continue with Google",
							imageName: "google",
							foregroundColor: .black
						)
						.frame(width: proxy.size.width * 0.8)
						.onTapGesture {
							Task {
								try await viewModel.siginGoogle()
							}
						}

						Spacer()

						// Terms and privacy text
						(
							Text("By continuing, you agree to Meme world's ")
								.font(.footnote)
							+
							Text("Terms of services ")
								.font(.footnote)
								.foregroundStyle(.blue)
								.fontWeight(.bold)
							+
							Text("and acknowledge that you've read our ")
								.font(.footnote)
							+
							Text("privacy policy. Notice at collection")
								.font(.footnote)
								.foregroundStyle(.blue)
								.fontWeight(.bold)
						)
						.multilineTextAlignment(.center)
						.padding(.bottom)
						.frame(width: proxy.size.width * 0.85)
					}
					.frame(maxWidth: .infinity, alignment: .center)
				}
			}
			.fullScreenCover(isPresented: $viewModel.showSingInView) {
				signInView(viewModel: viewModel)
			}
			.navigationDestination(isPresented: $viewModel.showAddPassword) {
				addPasswordView(viewModel: viewModel)
					.navigationBarBackButtonHidden()
			}
		}
	}
}

#Preview {
	NavigationStack {
		loginView()
	}
}

struct loginButton: View {
	private var color: Color
	private var width: CGFloat
	private var title: String
	private var imageName: String?
	private var foregroundColor: Color
	
	init(color: Color, width: CGFloat, title: String, imageName: String, foregroundColor: Color) {
		self.color = color
		self.width = width
		self.title = title
		self.imageName = imageName
		self.foregroundColor = foregroundColor
	}
	
	var body: some View {
		HStack(spacing: 10) {
			if let imageName = imageName, !imageName.isEmpty {
				Image(imageName)
					.resizable()
					.frame(width: 24, height: 24)
			}
			
			Text(title)
				.font(.headline)
				.foregroundColor(foregroundColor)
		}
		.frame(maxWidth: .infinity, minHeight: 50)
		.background(color)
		.clipShape(RoundedRectangle(cornerRadius: 20))
	}
}
