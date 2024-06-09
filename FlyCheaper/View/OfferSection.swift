//
//  OfferSection.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 05.06.24.
//

import SwiftUI

struct OfferSection: View {
    
    @ObservedObject var viewModel = OfferViewModel()

    
    var body: some View {
        
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
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                        } else {
                            ForEach(viewModel.offers) { offer in
                                
                                OfferItemView(imageName: offer.id, title: offer.title, town: offer.town, price: offer.price.value)
                                
                            } }
                    }
                }
                .onAppear {
                    viewModel.fetchOffers()
                }
                .scrollIndicators(.hidden)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            }
        
    }
}

#Preview {
    OfferSection()
}
