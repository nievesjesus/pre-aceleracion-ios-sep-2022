//
//  PokemonListService.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 02/09/2022.
//

import Foundation

class PokemonListService {
    
    func getPokemons(onComplete: @escaping ([PokemonDTO]) -> Void,
                     onError: @escaping (String) -> Void) {
        
        ApiManager.shared.getCall(url: "https://pokeapi.co/api/v2/pokemon?limit=151") { response in
            
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let result = try decoder.decode(PokemonListDTO.self, from: data)
                        onComplete(result.results)
                    }
                } catch {
                    onError("no se pudo procesar el json")
                }
            case .failure(_):
                onError("error en la api")
            }
        }
        
    }
    
}
