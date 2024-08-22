//
//  VpnListView.swift
//  VpnAppUI
//
//  Created by zehra özer on 22.08.2024.
//

import SwiftUI

struct VpnListView: View {
    @Environment (\.dismiss) var dismiss
   @StateObject var viewmodel = CountryViewModel()
    @AppStorage ("gotopremium") var gotopremium = false
    @AppStorage ("isPurchased") var isPurchased = false
    
    @State var selectedCountry = ""
    @AppStorage ("locationName") var locationName = "turkey"
    @AppStorage("locationImage") var locationImage = "turkey"
    @State var searctext = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    HStack {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                dismiss()
                                
                            }
                        
                        Spacer()
                        
                    }.padding(.horizontal)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(.white.opacity(0.5))
                            .frame(height: 40)
                        
                        TextField("Search server" , text:$viewmodel.searchText)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                    }.padding(.horizontal)
                    
                    List {
                        ForEach (viewmodel.filteredCountries) { item in
                            HStack {
                                Image(item.flagImageName.rawValue)
                                    .resizable()
                                    .frame(width: 50 , height: 50)
                                
                                Text(item.name.rawValue)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                Spacer()
                                Image(!isPurchased && item.isLock ? "crown" : "" )
                                    .resizable()
                                    .frame(width: 25 , height: 25)
                                Image(systemName: selectedCountry == item.name.rawValue ? "checkmark" : "")
                                    .imageScale(.large)
                                    .foregroundColor(.white)
                                Image(systemName: item.isFavorite ?  "heart.fill" : "heart")
                                    .imageScale(.large)
                                    .foregroundColor(item.isFavorite ? .color1 : .white)
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            if isPurchased && item.isLock {
                                                HapticFeedBack.playSelection()
                                                gotopremium.toggle()
                                                
                                            } else {
                                                HapticFeedBack.playSelection()
                                                viewmodel.toogleFavorite(for: item)
                                            }
                                        }
                                    }
                            }
                            .onTapGesture {
                                withAnimation {
                                    if !isPurchased && item.isLock {
                                        HapticFeedBack.playSelection()
                                        gotopremium.toggle()
                                    } else {
                                        HapticFeedBack.playSelection()
                                        selectedCountry = item.name.rawValue
                                        locationName = item.name.rawValue
                                        locationImage = item.flagImageName.rawValue
                                    }
                                }
                            }
                        }.listRowBackground(Color.clear)
                    }.listStyle(.plain)
                }
            } .onAppear {
                selectedCountry = locationName
            }
        } . navigationBarBackButtonHidden()
    }
}

#Preview {
    VpnListView()
}
