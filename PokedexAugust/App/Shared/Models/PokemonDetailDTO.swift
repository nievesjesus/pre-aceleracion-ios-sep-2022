//
//  PokemonDetailDTO.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 17/09/2022.
//

import Foundation

struct PokemonDetailDTO: Codable {
    let id: Int
    let name: String
    let sprites: SpriteDTO
}
