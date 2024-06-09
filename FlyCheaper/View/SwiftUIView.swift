//
//  SwiftUIView.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 06.06.24.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var input: String = ""
    
    var body: some View {
        ZStack {
//            Color.gray
            
            TextField(text: $input) {
                Text("Откуда - Москва")
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
