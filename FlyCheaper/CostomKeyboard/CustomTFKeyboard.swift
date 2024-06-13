//
//  CustomTFKeyboard.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 08.06.24.
//

import SwiftUI

extension TextField {
    @ViewBuilder
    func inputView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        self
            .background {
                SetTFKeyboard(keyboardContent: content())
            }
    }
    
}

fileprivate struct SetTFKeyboard<Content: View>: UIViewRepresentable {
    var keyboardContent: Content
    @State private var hostingController: UIHostingController<Content>?
    
    func makeUIView(context: Context) -> some UIView {
        return UIView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            if let textFieldContentinnerView = uiView.superview?.superview {
                if let textField = textFieldContentinnerView.findTextField {
                    if textField.inputView == nil {
                        hostingController = UIHostingController(rootView: keyboardContent)
                        hostingController?.view.frame = .init(origin: .zero, size: hostingController?.view.intrinsicContentSize ?? .zero)
                        textField.inputView = hostingController?.view
                    } else {
                        hostingController?.rootView = keyboardContent
                    }
                    
                } else {
                    print("Failed to find textfield")
                }
            }
        }
    }
}

fileprivate extension UIView {
    var allSubviews: [UIView] {
        return subviews.flatMap { [$0] + $0.subviews }
    }
    var findTextField: UITextField? {
        if let textField = allSubviews.first(where: { view in
            view is UITextField
        }) as? UITextField {
            return textField
        }
        return nil
    }
}

struct CustomTFKeyboard: View {
    var body: some View {
        Text("Hello, World!")
    }
}
#Preview {
    CustomTFKeyboard()
}
