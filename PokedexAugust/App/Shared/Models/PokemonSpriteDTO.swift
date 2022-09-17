//
//  PokemonSpriteDTO.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 17/09/2022.
//

import Foundation

struct SpriteDTO: Codable {
    let other: SpriteOther?
}

struct SpriteOther: Codable {
    let home: SpriteHome?
}

struct SpriteHome: Codable {
    let frontDefault: String?
}
