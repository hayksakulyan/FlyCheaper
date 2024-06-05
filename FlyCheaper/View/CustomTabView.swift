//
//  CustomTabView.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 05.06.24.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedIndex = 0

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            VStack {
                // Content
                ZStack {
                    switch selectedIndex {
                    case 0:
                        ContentView()
                    case 1:
                        Text("Отели")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                    case 2:
                        Text("Короче")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                    case 3:
                        Text("Подписки")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                    default:
                        Text("Профиль")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                // Custom Tab Bar
                HStack {
                    TabBarItem(icon: "Plane", title: "Авиабилеты", isSelected: selectedIndex == 0)
                        .onTapGesture { selectedIndex = 0 }
                    Spacer()
                    TabBarItem(icon: "Bed", title: "Отели", isSelected: selectedIndex == 1)
                        .onTapGesture { selectedIndex = 1 }
                    Spacer()
                    TabBarItem(icon: "Location", title: "Короче", isSelected: selectedIndex == 2)
                        .onTapGesture { selectedIndex = 2 }
                    Spacer()
                    TabBarItem(icon: "Ring", title: "Подписки", isSelected: selectedIndex == 3)
                        .onTapGesture { selectedIndex = 3 }
                    Spacer()
                    TabBarItem(icon: "Person", title: "Профиль", isSelected: selectedIndex == 4)
                        .onTapGesture { selectedIndex = 4 }
                }
                .padding()
            }
            .ignoresSafeArea(.all)
        }

    }
}

struct TabBarItem: View {
    let icon: String
    let title: String
    let isSelected: Bool

    var body: some View {
        VStack {
            Image(icon)
                .renderingMode(.template)
                .foregroundColor(isSelected ? .blue : .gray)
            Text(title)
                .font(Font.custom("SFProDisplay-Semibold", size: 10))

                .foregroundColor(isSelected ? .blue : Color("ShadowColorHex25"))
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
