//
//  Order.swift
//  CupcakeCorner
//
//  Created by Rick Brown on 26/09/2021.
//

import Foundation

class Order: ObservableObject {
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Raspberry Ripple"]
  
  @Published var type: Int = 0
  @Published var quantity: Int = 3
  
  @Published var specialRequestEnabled = false {
    didSet {
      if specialRequestEnabled == false {
        extraFrosting = false
        addSprinkles = false
      }
    }
  }
  @Published var extraFrosting = false
  @Published var addSprinkles = false
}
