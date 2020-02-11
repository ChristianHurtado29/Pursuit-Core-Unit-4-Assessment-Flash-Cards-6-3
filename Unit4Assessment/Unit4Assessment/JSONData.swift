//
//  LocalAPICall.swift
//  Unit4Assessment
//
//  Created by Christian Hurtado on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation
public enum ServiceError: Error {
  case resourcePathDoesNotExist
  case contentsNotFound
  case decodingError(Error)
}

class JSONData {
  public static func getCardsLocally() throws -> [Cards] {
    guard let path = Bundle.main.path(forResource: "cards", ofType: "json") else {
      throw ServiceError.resourcePathDoesNotExist
    }
    guard let json = FileManager.default.contents(atPath: path) else {
      throw ServiceError.contentsNotFound
    }
    do {
      let cards = try JSONDecoder().decode([Cards].self, from: json)
        return cards
    } catch {
      throw ServiceError.decodingError(error)
    }
  }
}
