//
//  SceneDelegate.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 10/08/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowsScene = (scene as? UIWindowScene) else { return }
        let mainViewController = PokemonListViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window = UIWindow(windowScene: windowsScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    
}

