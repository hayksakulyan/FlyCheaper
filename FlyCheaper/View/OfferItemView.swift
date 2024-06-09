//
//  OfferItemView.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 05.06.24.
//

import SwiftUI

struct OfferItemView:View {
    @State var imageName: Int
    @State var title: String
    @State var town: String
    @State var price: Int

    var body: some View {
        
            VStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color.black)
                        .frame(width: 132, height: 133.6)
                    Image("\(imageName)")
                        .resizable()
                        .frame(width: 132, height: 133.6)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("\(title)")
                            .font(Font.custom("SFProDisplay-Semibold", size: 16))
                            .foregroundStyle(.white)
                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                        Text("\(town)")
                            .font(Font.custom("SFProDisplay-Regular", size: 14))
                            .foregroundStyle(.white)
                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                        HStack(spacing: 0) {
                            Image("Plane")
                                .resizable()
                                .frame(width: 17.06, height: 17.06)
                            Text("\(price) ₽")
                                .font(Font.custom("SFProDisplay-Regular", size: 14))
                                .foregroundStyle(.white)
                                .padding(EdgeInsets(top: 4, leading: 3.94, bottom: 0, trailing: 0))
                        }
                    }
                    Spacer()
                }
            }
            .padding(EdgeInsets(top: 26, leading: 0, bottom: 0, trailing: 0))
        

    }
}

#Preview {
    OfferItemView(imageName: 1, title: "title", town: "town", price: 12000)
}
