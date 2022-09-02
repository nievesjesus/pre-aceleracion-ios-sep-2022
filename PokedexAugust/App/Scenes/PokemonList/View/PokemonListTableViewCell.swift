//
//  PokemonListTableViewCell.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 02/09/2022.
//

import Foundation
import UIKit

class PokemonListTableViewCell: UITableViewCell {
    
    var name: String? {
        didSet {
            pokemonName.text = name
        }
    }
    private lazy var pokemonImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.layer.cornerRadius = 30
        aImage.backgroundColor = .lightGray
        aImage.image = UIImage(named: "pokeball")
        return aImage
    }()
    
    private lazy var pokemonName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .darkGray
        aLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return aLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView (){
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(pokemonImage)
        self.contentView.addSubview(pokemonName)
        
    }
    
    private func setupConstraints (){
        NSLayoutConstraint.activate([
            pokemonImage.heightAnchor.constraint(equalToConstant: 60),
            pokemonImage.widthAnchor.constraint(equalToConstant: 60),
            
            pokemonImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pokemonImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            pokemonImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            pokemonName.leadingAnchor.constraint(equalTo: pokemonImage.trailingAnchor, constant: 16),
            pokemonName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            pokemonName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            pokemonName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
        ])
    }
}
