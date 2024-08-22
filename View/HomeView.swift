//
//  HomeView.swift
//  VpnAppUI
//
//  Created by zehra özer on 21.08.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var buttonOpacity = false
    @AppStorage("locationName") var locationName = "turkey"
    @AppStorage("locationImage") var locationImage = "turkey"
    @AppStorage("gotopremium") var gotopremium = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black).ignoresSafeArea()
                VStack {
                    HStack {
                        VStack (alignment : .leading) {
                            Text("Merhaba")
                                .font(.footnote)
                                .fontWeight(.light)
                                .foregroundStyle(.gray)
                            
                            Text("Welcome back!")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                        Spacer()
                        
                        Button {
                            gotopremium.toggle()
                        } label : {
                            Image("crown")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .frame(width: 30 , height: 30)
                                .foregroundColor(Color.color1)
                        }
                    }.padding(.horizontal)
                    
                    location()
                    
                    customGrid()
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.black.opacity(0.2))
                            .frame(width: 100 , height: 40)
                        
                        HStack {
                            Image("crown")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .frame(width: 20 , height: 20)
                                .foregroundColor(.color1)
                            
                            Text("Go to premium")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundStyle(Color.white)
                            
                        }
                    }.padding(.bottom)
                    
                    Spacer()
                        .frame(width: 60)
                    
                    Text("Conneciton Time")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                    
                    Text("00:00:00")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    Button {
                        withAnimation(.snappy) {
                            buttonOpacity.toggle()
                            HapticFeedBack.playSelection()
                        }
                    } label : {
                        ZStack {
                            Circle()
                                .fill(.black.opacity(0.2))
                                .frame(width: 120 , height: 120)
                            
                            Circle()
                                .fill(buttonOpacity ? .green : .clear)
                                .frame(width: buttonOpacity ? 120 : 0 , height: buttonOpacity ? 120 : 0)
                            
                            Image(systemName: "power")
                                .resizable()
                                .frame(width: 50 , height: 50)
                                .foregroundColor(buttonOpacity ? .white : .red)
                                .fontWeight(.bold)
                        }
                    }.buttonStyle(.plain)
                        .padding(.top , 25)
                    
                    Spacer()
                }
            }
        }.fullScreenCover(isPresented: $gotopremium) {
        PremiumView()
        }
    }
    
    func location() -> some View {
        NavigationLink(destination: VpnListView()) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.black.opacity(0.2))
                    .frame(height: 80)
                
                HStack (spacing : 20) {
                    Image(locationImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50 , height: 50)
                    
                    VStack (alignment:.leading) {
                        Text(locationName)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        Text("37.128.90.11")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15 , height: 15)
                        .foregroundColor(.gray)
                }.padding(.horizontal)
            }.padding(.horizontal)
        }
    }
    
    func  customGrid() -> some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.black.opacity(0.2))
                    .frame(height: 80)
                HStack {
                    Image(systemName: "arrow.down.circle")
                        .imageScale(.large)
                        .foregroundColor(.green)
                        .rotationEffect(.degrees(45))
                    
                    VStack (alignment:.leading) {
                        Text("Download")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundStyle(.gray)
                        
                        Text("145 Mbit/s")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                }
            }
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.black.opacity(0.2))
                    .frame(height: 80)
                HStack {
                    Image(systemName: "arrow.up.circle")
                        .imageScale(.large)
                        .foregroundColor(.red)
                        .rotationEffect(.degrees(45))
                    
                    VStack (alignment:.leading) {
                        Text("Upload")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundStyle(.gray)
                        
                        Text("90 Mbit/s")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
    
}

#Preview {
    HomeView()
}
