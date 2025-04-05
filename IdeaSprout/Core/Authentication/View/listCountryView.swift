//
//  listCountryView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 06/04/2025.
//

import SwiftUI

struct listCountryView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable private var viewModel : loginViewModel
    init(viewModel: loginViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationStack {
            ScrollView(content: {
                VStack(alignment:.leading, content: {
                    Text("For your language we use the language selected in your phone settings")
                        .font(.headline)
                        .foregroundStyle(Color(.darkGray))
                    
                    ForEach(Locale.isoRegionCodes, id: \.self){ code in
                        if let countryName = Locale.current.localizedString(forRegionCode: code){
                            Text(countryName)
                                .fontWeight(.bold)
                                .padding(.top)
                                .onTapGesture {
                                    viewModel.country = countryName
                                    dismiss()
                                }
                            
                        }
                    }
                })
                .padding()
            }).scrollIndicators(.hidden)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading, content: {
                        HStack(content: {
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .onTapGesture {
                                    dismiss()
                                }
                            Text("Country/Region")
                        })
                    })
                }
        }
    }
}

#Preview {

        listCountryView(viewModel: loginViewModel())
    }
