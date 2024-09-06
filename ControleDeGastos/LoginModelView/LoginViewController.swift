//
//  LoginViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 26/06/24.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

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
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cadastre-se", for: .normal)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.tintColor = .black
        return button
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
        view.addSubview(registerButton)
        
        userEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userEmailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userEmailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            userEmailTextField.widthAnchor.constraint(equalToConstant: 200),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8)
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
// MARK: - Botões
    @objc func loginButtonTapped() {
        //let collectionMainViewController = CollectionMainViewController()
        let loginInteractor = LoginInteractorController(emailFromLVC: getUserEmail(), passwordFromLVC: getUserPassword())

        loginInteractor.emailValidate()
    }
   
    @objc func registerButtonTapped() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: false)
    }
// MARK: - Envio de informações
    
    func getUserEmail() -> String {
        let userEmail = userEmailTextField.text ?? ""
        return userEmail
    }
    
    func getUserPassword() -> String {
        let userPassword = passwordTextField.text ?? ""
        return userPassword
    }

}
