//
//  PokemonViewModel.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/26/23.
//

import Foundation

class MajoraViewModel: ObservableObject{
    @Published var items = [Items]()
    
    
    
    private let service = MajoraDataService()
    init() {
        fetchItems()
        
    }
    
    func fetchItems() {
        service.fetchItems() { itemsArray in
            DispatchQueue.main.async{
                self.items = itemsArray
            }
        }
        
    }
    
    
    func getItem(item: Items) -> Int {
        if let index = self.items.firstIndex(of: item) {
            return index + 1
        }
        return 0
    }
    
}

