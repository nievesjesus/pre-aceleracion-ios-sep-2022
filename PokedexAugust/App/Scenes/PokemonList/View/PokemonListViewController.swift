//
//  PokemonListViewController.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 26/08/2022.
//

import UIKit

class PokemonListViewController: UIViewController {

    private var service = PokemonListService()
    private var viewModel: PokemonListViewModel?
    
    private lazy var tableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        aTable.delegate = self
        aTable.dataSource = self
        aTable.register(PokemonListTableViewCell.self, forCellReuseIdentifier: String(describing: PokemonListTableViewCell.self))
        view.addSubview(aTable)
        return aTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = PokemonListViewModel(service: self.service)
        
        self.viewModel?.getPokemons {
            self.tableView.reloadData()
        }
    }
    
    private func setupView (){
        self.title = "Pokemon List"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupConstraints (){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
}


extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("seleccionado")
    }
    
}

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.pokemons.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonListTableViewCell.self), for: indexPath) as? PokemonListTableViewCell else {
            return UITableViewCell()
        }
        
        if let pokemon = self.viewModel?.pokemons[indexPath.row] {
            cell.name = pokemon.name
        }
        return cell
    }
}
