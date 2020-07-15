//
//  GetAPIData.swift
//  Tea
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct Response: Codable{
    struct Result: Codable {
        let trackId: Int
        let collectionName: String
        let trackName: String
    }
    
    let results: [Result]
}

struct GetAPIData: View {
    
    @State private var results: [Response.Result] = []
    
    var body: some View {
        List(results, id: \.trackId) { result in
            VStack(alignment: .leading, spacing: 10) {
                Text(result.trackName)
                    .font(.headline)
                Text(result.collectionName)
            }
        }.onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
            else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let decodedData =  try? JSONDecoder().decode(Response.self, from: data)
                else { return }
            DispatchQueue.main.async {
                 self.results = decodedData.results
            }
        }.resume()
    }
}

struct GetAPIData_Previews: PreviewProvider {
    static var previews: some View {
        GetAPIData()
    }
}
