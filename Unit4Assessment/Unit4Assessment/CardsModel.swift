//
//  CardsModel.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

struct Cards: Codable & Equatable {
    let cards: [CardInfo]
}

struct CardInfo: Codable & Equatable {
    let id: String
    let cardTitle: String
    let facts: [String]
}
