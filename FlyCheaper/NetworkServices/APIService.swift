//
//  APIService.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 06.06.24.
//

import Foundation
import Combine

final class APIService {
    static let baseUrl = "https://run.mocky.io"
    
    
    private let networkManager = NetworkManager()
    
    func fetchOffers(endpoint: RequestURL = .offers) -> AnyPublisher<[Offer], Error> {
        guard let url = URL(string: "\(RequestURL.offers.urlString)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return networkManager.fetchData(from: url)
            .decode(type: OfferResponse.self, decoder: JSONDecoder())
            .map(\.offers)
            .eraseToAnyPublisher()
    }
}
