//
//  ShopView.swift
//  Slot777
//
//  Created by Sirac Seyidov on 26.02.2024.
//

import SwiftUI

struct ShopView: View {
    let w  = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    @State private var credits: Int = UserDefaults.standard.integer(forKey: "credits")
    @State private var skin: Int = UserDefaults.standard.integer(forKey: "skin")
    
    var body: some View {
        VStack{
            VStack{
                Text("Shop")
                    .foregroundStyle(.white)
                    .font(Font.custom("001InterstellarLog", size: 48))
                HStack{
                    HStack{
                        Text(String(credits))
                            .foregroundStyle(.white)
                            .font(Font.custom("001InterstellarLog", size: 24))
                        Image("dollar")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding()
                    .background(Colors().brown)
                    .cornerRadius(8)
                    .shadow(color: .black, radius: 8, x: 0, y: 5)
                    Spacer()
                }
            }.padding()
            
            Spacer()
            
            ScrollView(.vertical){
                ShopItem1(skin: $skin)
                    .frame(width: w*0.7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(CoinColors().border2, lineWidth: 3)
                    )
                    .padding(.vertical, 5)
                ShopItem2(skin: $skin, credits: $credits)
                    .frame(width: w*0.7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(CoinColors().border2, lineWidth: 3)
                    )
                    .padding(.vertical, 5)
            }
            .padding()
            .background(Colors().brown)
            .cornerRadius(20)
            .shadow(color: .black, radius: 16, x: 0, y: 10)
        }
        .frame(width: w)
        .background(
            Image("bg2")
                .resizable()
                .ignoresSafeArea(.all)
        )
    }
}

struct ShopItem1: View {
    @Binding var skin: Int
    
    var body: some View {
        VStack{
            Text("Fruits")
                .foregroundStyle(.white)
                .font(Font.custom("001InterstellarLog", size: 24))
            VStack{
                HStack{
                    Image("orange_asset")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Image("grapes_asset")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
                HStack{
                    Image("strawberry_asset")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Image("seven_asset_5")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(CoinColors().fill2, lineWidth: 3)
            )
            
            HStack{
                Text("Free")
                    .foregroundStyle(.white)
                    .font(Font.custom("001InterstellarLog", size: 16))
                Button(action: {
                    skin = 0
                    UserDefaults.standard.set(0, forKey: "skin")
                }){
                    Text(skin==0 ? "Selected" : "Select")
                        .foregroundStyle(.white)
                        .font(Font.custom("001InterstellarLog", size: 16))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(CoinColors().fill2, lineWidth: 1)
                        )
                }
            }.padding()
        }
        .padding()
    }
}

struct ShopItem2: View {
    @State private var bought: Bool = UserDefaults.standard.bool(forKey: "shop2")
    @Binding var skin: Int
    @Binding var credits: Int
    
    var body: some View {
        VStack{
            Text("Candies")
                .foregroundStyle(.white)
                .font(Font.custom("001InterstellarLog", size: 24))
            VStack{
                HStack{
                    Image("blue_candy_asset")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Image("red_candy_asset")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
                HStack{
                    Image("green_candy_asset")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Image("candy_asset")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(CoinColors().fill2, lineWidth: 3)
            )
            
            HStack{
                HStack{
                    Text("750")
                        .foregroundStyle(.white)
                        .font(Font.custom("001InterstellarLog", size: 16))
                    Image("dollar")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                Button(action: {
                    if !bought{
                        if credits > 750{
                            credits -= 750
                            UserDefaults.standard.set(credits, forKey: "credits")
                            UserDefaults.standard.set(true, forKey: "shop2")
                            bought = true
                            skin = 1
                            UserDefaults.standard.set(1, forKey: "skin")
                        }
                    }else{
                        skin = 1
                        UserDefaults.standard.set(1, forKey: "skin")
                    }
                }){
                    Text(bought ? (skin==1 ? "Selected" : "Select") : "Buy")
                        .foregroundStyle(.white)
                        .font(Font.custom("001InterstellarLog", size: 16))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(CoinColors().fill2, lineWidth: 1)
                        )
                }
            }.padding()
        }
        .padding()
    }
}

#Preview {
    ShopView()
}
