//
//  addAgeView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 04/04/2025.
//

import SwiftUI

struct addAgeView: View {
    @Bindable private var viewModel : loginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel: loginViewModel) {
        self._viewModel = Bindable(wrappedValue:viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack(spacing:20, content: {
                    Text("Hi \(viewModel.fullName) Enter your date of birth")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    Text("To help keep pinterest safe, we now require your date of birth. your date of birth will help us provide more personalized reccomendations and relevent ads, we won't share this information without your permission and won't be visible on your profile")
                        .frame(width: proxy.size.width * 0.9)
                    Button(action: {viewModel.isPresented = true}, label: {
                        Text("\(viewModel.selectedDate.formatted(date: .long, time: .omitted))")
                            .foregroundStyle(.red)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.vertical)
                    })
                    Text("Use your own age even if this is business")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                    Spacer()
                    NavigationLink(destination: {addGenderView(viewModel: viewModel).navigationBarBackButtonHidden()}, label: {
                        Text("Next")
                            .frame(width: proxy.size.width * 0.9, height: 60)
                            .foregroundStyle(viewModel.birthDate.count < 3 ? .black : .white)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .background(viewModel.birthDate.count < 3 ? Color(.systemGray5) : .red)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }).padding(.bottom)
                }).padding()
                .toolbar{
                    ToolbarItem(placement: .topBarLeading, content: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .onTapGesture {
                                viewModel.birthDate = ""
                                dismiss()
                            }
                    })
                    ToolbarItem(placement:.principal, content: {
                        indicatorView(numberOfScreen: 3)
                    })
                }
                datePickerPopup(viewModel: viewModel)
               
            }
        }
    }
}

#Preview {NavigationStack{
    addAgeView(viewModel: loginViewModel())
}
}

struct datePickerPopup: View {
    @Bindable private var viewModel: loginViewModel
    init(viewModel: loginViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    var body: some View {
        ZStack(content: {
            if viewModel.isPresented {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        viewModel.isPresented = false
                    }
            }
            VStack(content: {
                HStack(spacing: 20, content: {
                    Picker(selection:$viewModel.tempDate, content: {
                        ForEach(1..<32, id: \.self){day in
                            Text(String(format: "%02d", day))
                                .tag(viewModel.dayComponent(day: day))
                        }
                    }, label: {Text("Day")}).pickerStyle(.wheel)
                        .frame(width: 60)
                        .clipped()
                    
                    Picker(selection:$viewModel.tempDate, content: {
                        ForEach(0..<12, id: \.self){month in
                            Text(viewModel.month[month])
                                .tag(viewModel.monthComponent(month: month+1))
                        }
                    }, label: {Text("Month")}).pickerStyle(.wheel)
                        .frame(width: 80)
                        .clipped()
                    
                    Picker(selection:$viewModel.tempDate, content: {
                        ForEach(viewModel.availableYears, id: \.self){year in
                            Text(String(year))
                                .tag(viewModel.yearComponent(year: year))
                        }
                    }, label: {Text("Year")}).pickerStyle(.wheel)
                        .frame(width: 80)
                        .clipped()
                })
                HStack(spacing: 30,content: {
                    Spacer()
                    Button(action: {viewModel.isPresented = false}, label: {
                        Text("CANCEL")
                        
                    })
                    
                    Button(action: {
                        viewModel.selectedDate = viewModel.tempDate
                        viewModel.isPresented = false
                    }, label: {
                        Text("OK")
                    })
                    
                }).padding(30)
                    .foregroundStyle(.black)
            })
            
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal,20)
            .opacity(viewModel.isPresented == true ? 1: 0)
            .scaleEffect(viewModel.isPresented ? 1: 0.5)
            .animation(.spring(), value: viewModel.isPresented)
        })
    }
}
