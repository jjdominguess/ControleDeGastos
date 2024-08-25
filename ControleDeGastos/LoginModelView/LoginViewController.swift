//
//  LoginViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 26/06/24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {

    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let userEmailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true // para ofuscar os caracteres inseridos no campo senha
        return passwordField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        //No button.addTarget o self, é para
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageCoordinates()
        setupFieldViews()
    }
  
    private func setupFieldViews() {
        
        view.addSubview(userEmailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        userEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userEmailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userEmailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            userEmailTextField.widthAnchor.constraint(equalToConstant: 200),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20)
        ])
    }
    
    private func backgroundImageCoordinates() {
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
        
    @objc func loginButtonTapped() {
        let collectionMainViewController = CollectionMainViewController()
        let loginInteractor = LoginInteractorController(email: getUserEmail(), password: getUserPassword())

        loginInteractor.emailValidate()

        navigationController?.pushViewController(collectionMainViewController, animated: true)
    }
    
    func getUserEmail() -> String {
        let userEmail = userEmailTextField.text ?? ""
        return userEmail
    }
    
    func getUserPassword() -> String {
        let userPassword = passwordTextField.text ?? ""
        return userPassword
    }

}
