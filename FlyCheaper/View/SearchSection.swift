//
//  SearchSection.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 04.06.24.
//

import SwiftUI

struct SearchSection: View {
    @State private var text: String = ""
    @FocusState private var showKeyboard: Bool
    private var alphabet = ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х", "ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э", "я", "ч", "с", "м", "и", "т", "ь", "б", "ю"]
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
                            TextField(text: $text) {
                                Text("Откуда - Москва")
                                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                                    .foregroundStyle(.white)
                            }
                            .inputView(content: {
                                CustomKeyboardView()
                            })
                            .focused($showKeyboard)
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
                            .inputView(content: {
                                CustomKeyboardView()
                            })
                            .focused($showKeyboard)
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
    // Custom keyboard
    @ViewBuilder
    func CustomKeyboardView() -> some View {
        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 10), count: 11), spacing: 10) {
            ForEach(alphabet, id: \.self) { index in
                keyboardButtonView(.text("\(index)")) {
                    print(index)
                    text.append("\(index)")
                        
                }
            }
            
            keyboardButtonView(.image("delete.backward")) {
                if !text.isEmpty {
                    text.removeLast()
                }
            }
            keyboardButtonView(.text("0")) {
                text.append("0")

            }
            keyboardButtonView(.image("checkmark.circle.fill")) {
                showKeyboard = false
            }
            
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        .background {
            Rectangle()
                .fill(Color.black.gradient)
                .ignoresSafeArea()
        }
    }
    @ViewBuilder
    func keyboardButtonView(_ value: KeyboardValue, onTap: @escaping () -> ()) -> some View {
        Button(action: onTap) {
            ZStack {
                switch value {
                case .text(let string):
                    if string == "ю" {
                        
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray)
                            .frame(width: 28)
                        Text(string)
                            .font(.title)
                            .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    }
                case .image(let image):
                    Image(systemName: image)
                        .font(image == "checkmark.circle.fill" ? .title : .title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(image == "checkmark.circle.fill" ? .red : .white)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .contentShape(Rectangle())
        }
    }
}

//enum KeyboardValue {
//    case text(String)
//    case image(String)
//}

//}

#Preview {
    SearchSection()
}

