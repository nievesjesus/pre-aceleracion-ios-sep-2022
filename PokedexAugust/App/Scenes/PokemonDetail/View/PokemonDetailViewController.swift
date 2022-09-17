//
//  PokemonDetailViewController.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 26/08/2022.
//

import Foundation
import UIKit

class PokemonDetailViewController: UIViewController {
    
    private var service = PokemonDetailService()
    private var viewModel: PokemonDetailViewModel?
    var pokemonURL: String = ""

    private lazy var backgroundImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.image = UIImage(named: "pokedex")
        aImage.contentMode = .scaleAspectFill
        view.addSubview(aImage)
        return aImage
    }()
    
    private lazy var pokemonBackground: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.layer.cornerRadius = 70.0
        aView.backgroundColor = .white.withAlphaComponent(0.1)
        view.addSubview(aView)
        return aView
    }()

    private lazy var pokemonImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(aImage, aboveSubview: backgroundImage)
        return aImage
    }()
    
    private lazy var pokemonName: UILabel = {
       let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 28)
        aLabel.textAlignment = .center
        view.addSubview(aLabel)
        return aLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = PokemonDetailViewModel(pokemonURL: self.pokemonURL, service: self.service)
        
        self.viewModel?.getPokemon(onGetPokemon: { pokemon in
            self.pokemonName.text = pokemon.name
            
            if let sprite = pokemon.sprites.other?.home?.frontDefault, let url = URL(string: sprite) {
                self.pokemonImage.load(url: url)
            }
            
        })
    }
    
    private func setupView(){
        self.title = "Pokemon detail"
        self.view.backgroundColor = .white
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pokemonImage.heightAnchor.constraint(equalToConstant: 140),
            pokemonImage.widthAnchor.constraint(equalToConstant: 140),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 22),
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pokemonName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            pokemonBackground.heightAnchor.constraint(equalToConstant: 140),
            pokemonBackground.widthAnchor.constraint(equalToConstant: 140),
            pokemonBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
        ])
        
    }
    
}
