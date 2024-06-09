//
//  RequestURL.swift
//  FlyCheaper
//
//  Created by Hayk Sakulyan on 06.06.24.
//

import Foundation

// MARK: - endpoints
enum RequestURL {
    case offers
    case serchCountry
    case allTickets
    
    var urlString: String {
        switch self {
        case .offers:
            return "\(APIService.baseUrl)/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd"
        case .serchCountry:
            return "\(APIService.baseUrl)/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017"
        case .allTickets:
            return "\(APIService.baseUrl)/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf"
        
        }
    }
}


