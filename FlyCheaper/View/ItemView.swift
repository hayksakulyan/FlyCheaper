//
//  ItemView.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 05.06.24.
//

import SwiftUI

struct ItemView:View {
    
    @State var number: Int
    @State var imageName: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Image("\(imageName)")
                .resizable()
                .frame(width: 132, height: 133.6)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Item Item \(number)")
                        .font(Font.custom("SFProDisplay-Semibold", size: 16))
                        .foregroundStyle(.white)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                    Text("Item \(number)")
                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                        .foregroundStyle(.white)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                    HStack(spacing: 0) {
                        Image("Plane")
                            .resizable()
                            .frame(width: 17.06, height: 17.06)
                        Text("Item \(number) ₽")
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
    ItemView(number: 1, imageName: 1)
}
