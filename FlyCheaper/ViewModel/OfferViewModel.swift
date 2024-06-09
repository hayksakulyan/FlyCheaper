//
//  OfferViewModel.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 06.06.24.
//

import Foundation
import Combine

class OfferViewModel: ObservableObject {
    @Published var offers: [Offer] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let apiService = APIService()
    
    func fetchOffers() {
        apiService.fetchOffers(endpoint: .offers)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "Failed to fetch offers: \(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] offers in
                self?.offers = offers
            })
            .store(in: &cancellables)
    }
}
