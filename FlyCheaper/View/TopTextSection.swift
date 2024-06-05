//
//  TopTextSection.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 04.06.24.
//

import SwiftUI

struct TopTextSection: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("Поиск дешевых авиабилетов")
                .font(Font.custom("SFProDisplay-Semibold", size: 22))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("HeaderTextColorHex"))
            // frame 52 i poxaren height: 53 em drel vor 2 tox lini
                .frame(width: 172, height: 53)
                .border(Color("BorderColorHex"), width: 1)
                .shadow(color: Color("ShadowColorHex25"), radius: 4, x: 0, y: 4)

        }
        .padding(EdgeInsets(top: 58, leading: 0, bottom: 0, trailing: 0))
    }
}

#Preview {
    TopTextSection()
}
