//
//  PokemonService.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/26/23.
//

import Foundation

class MajoraDataService {
    let URLString = "http://127.0.0.1:5000/product"

    
    
    func fetchItems(completion: @escaping([Items]) -> Void) {
        guard let url = URL(string: URLString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received.")
                return
            }

            do {
                let items = try JSONDecoder().decode([Items].self, from: data)
                completion(items)
            } catch {
                print("Error decoding data: \(error)")
            }
            
            
        }.resume()
    }
   
    
    
}
