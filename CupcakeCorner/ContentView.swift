//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Rick Brown on 07/04/2021.
//

import SwiftUI

struct Response: Codable {
  var results: Array<Result>
}

struct Result: Codable {
  var trackId: Int
  var trackName: String
  var collectionName: String
}

struct ContentView: View {
  @State private var results = Array<Result>()
  
  var body: some View {
    List(results, id: \.trackId) { item in
      VStack(alignment: .leading) {
        Text(item.trackName)
          .font(.headline)
        
        Text(item.collectionName)
      }
    }
    .onAppear(perform: { loadData() })
  }
  
  private func loadData() {
    guard let url = URL(string: "https://itunes.apple.com/search?term=pink+floyd&entity=song") else {
      print("Invalid URL!")
      return
    }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
      if let data = data {
        if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
          DispatchQueue.main.async {
            self.results = decodedResponse.results
            return
          }
        }
        print("Fetch failed: \(error?.localizedDescription ?? "Unknown weird error")")
      }
    }.resume()
    
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
