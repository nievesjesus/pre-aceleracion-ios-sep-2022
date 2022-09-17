//
//  PokemonDetailViewModel.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 17/09/2022.
//

import Foundation

class PokemonDetailViewModel {
    private var service: PokemonDetailService
    private var pokemonURL: String
    
    init(pokemonURL: String, service: PokemonDetailService) {
        self.service = service
        self.pokemonURL = pokemonURL
    }
    
    func getPokemon(onGetPokemon: @escaping (PokemonDetailDTO) -> Void) {
        service.getPokemon(urlPokemon: self.pokemonURL) { pokemon in
            onGetPokemon(pokemon)
        } onError: { error in
            print("ha ocurrido un error", error)
        }
    }
}
