//
//  UserExampleUsingCodingKeys.swift
//  CupcakeCorner
//
//  Created by Rick Brown on 25/09/2021.
//

import Foundation
import SwiftUI

class User: ObservableObject, Codable {
  @Published var name: String = "Paul Hudson"
  
  enum CodingKeys: CodingKey {
    case name
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
  }
}
