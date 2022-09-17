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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !UserDefaults.standard.isUserLoggedIn {
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: false)
        }
    }
    private func setupView (){
        self.title = "Pokemon List"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOut))
    }
    
    private func setupConstraints (){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    @objc private func logOut() {
        UserDefaults.standard.isUserLoggedIn = false
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: false)
    }
    
}


extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.getPokemon(at: indexPath.row, onComplete: { pokemon in
            let vc = PokemonDetailViewController()
            vc.pokemonURL = pokemon.url
            self.navigationController?.pushViewController(vc, animated: true)
        })
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
