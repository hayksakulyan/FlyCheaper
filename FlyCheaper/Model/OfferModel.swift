//
//  OfferModel.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 05.06.24.
//

import Foundation

struct Offer: Codable, Identifiable {
    let id: Int
    let title: String
    let town: String
    let price: Price
}

struct Price: Codable {
    let value: Int
}

struct OfferResponse: Codable {
    let offers: [Offer]
}


