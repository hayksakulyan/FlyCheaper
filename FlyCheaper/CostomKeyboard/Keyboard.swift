//
//  Keyboard.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 08.06.24.
//

import SwiftUI

struct Keyboard: View {
    @State private var text: String = ""
    @FocusState private var showKeyboard: Bool
    private var alphabet = ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х", "ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э", "я", "ч", "с", "м", "и", "т", "ь", "б", "ю"]
    
    var body: some View {
        VStack {
//                Image(systemName: "heart.fill")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .foregroundStyle(Color.red)
            TextField("some text", text: $text)
                .inputView {
                    CustomKeyboardView()
                }
                .focused($showKeyboard)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .environment(\.colorScheme, .dark)
                .padding([.horizontal, .top], 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Rectangle()
                .fill(Color.innerRectangleColorHex)
                .ignoresSafeArea(.all)
            
        }
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

enum KeyboardValue {
    case text(String)
    case image(String)
}

#Preview {
    MainKeyboardView()
}
