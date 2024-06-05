//
//  ContentView.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 04.06.24.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            VStack(spacing: 0) {
                TopTextSection()
                
                SearchSection()
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Музыкально отлететь")
                            .font(Font.custom("SFProDisplay-Semibold", size: 22))
                            .foregroundStyle(Color.white)
                            .padding(EdgeInsets(top: 32, leading: 16, bottom: 0, trailing: 0))
                        Spacer()
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 67) {
                            ForEach(1..<4) {
                                
                                ItemView(number: $0, imageName: $0)
                                
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                }
                
                Spacer()
                
            }
        }
        .ignoresSafeArea(.all)
        
    }
}



#Preview {
    ContentView()
    
}
