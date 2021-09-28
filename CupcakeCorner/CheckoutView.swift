//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Rick Brown on 27/09/2021.
//

import SwiftUI

struct CheckoutView: View {
  @ObservedObject var order: Order
  
  var body: some View {
    GeometryReader { proxy in
      ScrollView {
        VStack {
          Image("cupcakes")
            .resizable().scaledToFit()
            .frame(width: proxy.size.width)
          
          Text("Your order total is: \(self.order.cost, specifier: "%.2f")")
            .font(.title)
          
          Button(action: {}) {
            Text("Place order".uppercased())
              .padding()
              .frame(maxWidth: .infinity)
              .background(Color.blue)
              .cornerRadius(12.0)
              .foregroundColor(.white)
              .padding()
          }
        }
      }
      .navigationBarTitle("Checkout", displayMode: .inline)
    }
  }
}

struct CheckoutView_Previews: PreviewProvider {
  static var previews: some View {
    CheckoutView(order: Order())
  }
}
