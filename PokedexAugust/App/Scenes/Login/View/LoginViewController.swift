//
//  LoginViewController.swift
//  PokedexAugust
//
//  Created by Jesus Nieves on 17/09/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    private lazy var stackView: UIStackView = {
        let aStackView = UIStackView()
        aStackView.distribution = .fillEqually
        aStackView.axis = .vertical
        aStackView.alignment = .fill
        aStackView.spacing = 16.0
        aStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aStackView)
        return aStackView
    }()
    
    private lazy var userLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.text = "Username:"
        return aLabel
    }()
    
    private lazy var userTextField: UITextField = {
        let aTextField = UITextField()
        aTextField.layer.cornerRadius = 12
        aTextField.layer.borderColor = UIColor.black.cgColor
        aTextField.layer.borderWidth = 1
        return aTextField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.text = "Password:"
        return aLabel
    }()
    
    private lazy var passwordTextField: UITextField = {
        let aTextField = UITextField()
        aTextField.layer.cornerRadius = 12
        aTextField.isSecureTextEntry = true
        aTextField.layer.borderColor = UIColor.black.cgColor
        aTextField.layer.borderWidth = 1
        return aTextField
    }()
    
    @objc private lazy var loginButton: UIButton = {
        let aButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 48))
        aButton.setTitle("Iniciar", for: .normal)
        aButton.backgroundColor = .cyan
        aButton.layer.cornerRadius = 8.0
        return aButton
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView (){
        self.view.backgroundColor = .white
        self.stackView.addArrangedSubview(userLabel)
        self.stackView.addArrangedSubview(userTextField)
        self.stackView.addArrangedSubview(passwordLabel)
        self.stackView.addArrangedSubview(passwordTextField)
        self.stackView.addArrangedSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
    }
    
    private func setupConstraints (){
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func loginPressed() {
        UserDefaults.standard.isUserLoggedIn = true
        self.dismiss(animated: true)
    }
    
}
