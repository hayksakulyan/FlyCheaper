//
//  SearchSection.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 04.06.24.
//

import SwiftUI

struct SearchSection: View {
    
    @State var from: String = ""
    @State var whereTo: String = ""
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color("MainRectangleColorHex"))
                    .frame(height: 122)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 90)
                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    .foregroundStyle(Color("InnerRectangleColorHex"))
                    .shadow(color: Color("ShadowColorHex25"), radius: 4, x: 0, y: 4)
                
                HStack {
                    Image("SearchIcon")
                        .frame(width: 16, height: 16)
                        .padding(.leading, 44)
                    
                    VStack(spacing: 0) {
                        HStack {
                            TextField(text: $from) {
                                Text("Откуда - Москва")
                                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                                    .foregroundStyle(.white)
                            }
                            .accentColor(.white)
                            .keyboardType(.alphabet)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 8, trailing: 0))
                            Spacer()
                        }
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 1)
                            .foregroundStyle(Color("RectanglaLineColorHex"))
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 48))
                        HStack(spacing: 0) {
                            TextField(text: $whereTo) {
                                Text("Куда - Турция")
                                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                                    .foregroundStyle(Color("RectanglaLineColorHex100"))
                            }
                            .accentColor(.white)
                            .padding(EdgeInsets(top: 8, leading: 20, bottom: 0, trailing: 0))
                            Spacer()
                        }
                    }
                }
                
            }
        }
        .padding(EdgeInsets(top: 38, leading: 0, bottom: 0, trailing: 0))
    }
}

#Preview {
    SearchSection()
}
