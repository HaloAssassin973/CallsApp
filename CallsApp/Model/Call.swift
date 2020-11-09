//
//  Call.swift
//  CallsApp
//
//  Created by Игорь Силаев on 08.11.2020.
//

import Foundation

// MARK: - Call

struct Call: Codable {
    let id, state: String
    let client: Client
    let type, created: String
    let businessNumber: BusinessNumber
    let origin: String
    let favorite: Bool
    let duration: String
}

// MARK: - BusinessNumber

struct BusinessNumber: Codable {
    let number, label: String
}

// MARK: - Client

struct Client: Codable {
    let address, name: String

    enum CodingKeys: String, CodingKey {
        case address
        case name = "Name"
    }
}
