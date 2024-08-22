//
//  PremiumView.swift
//  VpnAppUI
//
//  Created by zehra özer on 22.08.2024.
//

import SwiftUI

struct PremiumView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage ("isPurchased") var ispurschased = false
    private var priceTitle = ["1 Month" , "3 Month" , "6 Month"]
    private var price = ["$9.99" , "$19.99" , "$29.99"]
    private var priceSubtitle = ["Billed Montly" , "Save 20%" , "Save 30%"]
    @State var selectedTier = 0
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea(.all)
                VStack {
                    HStack {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .onTapGesture {
                                dismiss()
                            }
                        Spacer()
                        
                        Text("Upragrade to premium")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }.padding(.bottom)
                    
                    ScrollView (.vertical , showsIndicators: false) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.black.opacity(0.2))
                                .frame(height: 150)
                            
                            VStack {
                                Image("crown")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25 , height: 25)
                                    .background(
                                        Circle()
                                            .fill(Color.white.opacity(0.8))
                                            .frame(width: 50 , height: 50)
                                    ).padding(.bottom)
                                
                                Text("go to premium")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                                Text("Get full app access without restricions ads , and unlock all Serves!")
                                    .font(.footnote)
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                            }
                        }.frame(maxWidth: 150)
                        
                        HStack {
                            customGridPremium(systemSymbol: "lock.circle.fill", title: "Private", subtitle: "Connection")
                            customGridPremium(systemSymbol: "map.fill", title: "Unlock All", subtitle: "Servers")
                        }.padding(.top , 5)
                        
                        HStack {
                            customGridPremium(systemSymbol: "bolt.fill", title: "Faster than", subtitle: "Before")
                            customGridPremium(systemSymbol: "heart.fill", title: "No Annoying", subtitle: "Ads")
                        }
                        
                        VStack {
                            Text("Choose your plan")
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            
                            ForEach(price.indices , id:\.self) {
                                item in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.gray , lineWidth: 2)
                                        .frame(height: 70)
                                    
                                    HStack {
                                        ZStack {
                                            Image(systemName: selectedTier == item ? "checkmark.circle.fill" : "")
                                                .imageScale(.large)
                                                .foregroundColor(.color1)
                                            Circle()
                                                .stroke(.white , lineWidth: 2)
                                                .frame(width: 25 , height: 25)
                                        }
                                        
                                        Text(priceTitle[item])
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundStyle(.white)
                                        
                                        Spacer()
                                        
                                        VStack (alignment:.leading){
                                            Text(price[item])
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.color1)
                                            
                                            Text(priceSubtitle[item])
                                                .font(.footnote)
                                                .fontWeight(.regular)
                                                .foregroundStyle(.gray)
                                        }
                                    }.padding(.horizontal)
                                }
                                .onTapGesture {
                                    withAnimation {
                                        selectedTier = item
                                    }
                                }
                            }
                        }.padding([.top , .bottom] , 5)
                        
                        Button {
                            HapticFeedBack.playSelection()
                            ispurschased.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                dismiss()
                            }
                        } label: {
                            Text("Unlock Premium")
                                .font(.title3)
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(Color.color1)
                                        .frame(height: 60)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
            }
        }
    }
    
    struct customGridPremium : View {
        var systemSymbol : String
        var title : String
        var subtitle : String
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.black.opacity(0.2))
                    .frame(height: 80)
                
                HStack {
                    Image(systemName: systemSymbol)
                        .imageScale(.large)
                        .foregroundColor(.color1)
                    
                    VStack (alignment:.leading) {
                        Text(title)
                            .font(.title3)
                            .fontWeight(.light)
                            .foregroundStyle(.gray)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        Text(subtitle)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        
                    }
                }
            }.padding(.horizontal)
        }
    }
}

#Preview {
    PremiumView()
}
