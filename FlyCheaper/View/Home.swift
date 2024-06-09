//
//  Home.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 06.06.24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            VStack(spacing: 0) {
                TopTextSection()
                
                SearchSection()
                
                OfferSection()
                
                Spacer()
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    Home()
}
