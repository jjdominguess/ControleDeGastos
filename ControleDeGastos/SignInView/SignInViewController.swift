//
//  SignInViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 25/08/24.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    
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
    
    private let buttonCreate: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create", for: .normal)
        button.addTarget(self, action: #selector(buttonCreateTapped), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(buttonCreate)
    }
    
    func setupFields() {
        
    
    }
    
    @objc func buttonCreateTapped() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
