//
//  PokemonListViewModel.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 02/09/2022.
//

import Foundation

class PokemonListViewModel {
    
    private var service: PokemonListService
    var pokemons = [PokemonDTO]()
    
    init(service: PokemonListService){
        self.service = service
    }
    
    func getPokemons(onComplete: @escaping () -> Void) {
        service.getPokemons { results in
            self.pokemons = results
            onComplete()
        } onError: { error in
            print(error)
        }
    }
    
    func getPokemon(at index: Int, onComplete: @escaping (PokemonDTO) -> Void) {
        let pokemon = pokemons[index]
        onComplete(pokemon)
    }
    
}
