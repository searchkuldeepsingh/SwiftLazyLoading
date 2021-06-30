//
//  AnimalResponse.swift
//  SwiftLazyLoading
//
//  Created by Kuldeep on 30/06/21.
//

import Foundation

struct AnimalResponse: Decodable {
    let errorMessage: String
    let animals: [Animal]

    enum CodingKeys: String, CodingKey {
        case animals = "data"
        case errorMessage
    }
}

// MARK: -
struct Animal: Decodable {
    let name, image: String
}
