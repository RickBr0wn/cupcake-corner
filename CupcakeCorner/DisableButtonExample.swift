//
//  DisableButtonExample.swift
//  CupcakeCorner
//
//  Created by Rick Brown on 26/09/2021.
//

import SwiftUI

struct DisableButtonExample: View {
  @State private var username: String = ""
  @State private var email: String = ""
  
  var disableButton: Bool { username.count < 5 || email.count < 5 }
  
  var body: some View {
    Form {
      Section {
        TextField("Username", text: $username)
        
        TextField("Email", text: $email)
      }
      
      Section {
        Button("Create Account") {
          print("Created Account")
        }
        .disabled(disableButton)
      }
    }
  }
}

struct DisableButtonExample_Previews: PreviewProvider {
    static var previews: some View {
        DisableButtonExample()
    }
}
