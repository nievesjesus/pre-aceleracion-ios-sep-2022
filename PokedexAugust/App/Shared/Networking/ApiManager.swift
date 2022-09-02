//
//  ApiManager.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 02/09/2022.
//

import Alamofire

class ApiManager {
    
    static let shared = ApiManager()
    
    // GET HTTP
    func getCall(url: String, success: @escaping (Result<Data?, AFError>) -> Void ) {
        AF.request(url).response { response in
            success(response.result)
        }
    }
    
}

