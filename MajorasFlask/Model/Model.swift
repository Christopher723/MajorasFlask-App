//
//  Model.swift
//  MajorasFlask
//
//  Created by Christopher Woods on 10/31/23.
//

import Foundation

//
//  PokemonModel.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/26/23.
//

import Foundation


struct MajoraResponse: Codable {
    let results: [Items]
}

struct Items: Codable, Identifiable, Equatable {
    let description: String
    let id: Int
    let name: String
    
}


