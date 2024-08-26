//
//  SignInViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 25/08/24.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let emailField: UITextField = {
        let email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        return email
    }()
    
    private let passwordCreate: UITextField = {
        let pass = UITextField()
        pass.borderStyle = .roundedRect
        pass.placeholder = "Password"
        pass.isSecureTextEntry = true
        return pass
    }()
    
    private let buttonRegister: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create", for: .normal)
        button.addTarget(self, action: #selector(buttonCreateTapped), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(buttonRegister)
        setupBackground()
        setupLayout()
    }
    
    func setupLayout() {
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordCreate.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(emailField)
        view.addSubview(passwordCreate)
        view.addSubview(buttonRegister)
        
        NSLayoutConstraint.activate([
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            emailField.widthAnchor.constraint(equalToConstant: 200),
            
            passwordCreate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordCreate.centerYAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 33),
            passwordCreate.widthAnchor.constraint(equalToConstant: 200),
            
            buttonRegister.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRegister.centerYAnchor.constraint(equalTo: passwordCreate.bottomAnchor, constant: 30),
            
                   
        ])
    }
    
    func setupBackground() {
        backgroundImage.image = UIImage(named: "openart-abec444c0f0b494683695561b60b189a_raw")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func buttonCreateTapped() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: false)
    }
}
