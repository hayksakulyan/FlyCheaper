//
//  NetworkManager.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 06.06.24.
//

import Foundation
import Combine

final class NetworkManager {
    func fetchData(from url: URL) -> AnyPublisher<Data, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
