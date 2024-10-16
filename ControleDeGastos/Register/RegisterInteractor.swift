//
//  SignInInteractor.swift
//  ControleDeGastos
//
//  Created by Joao on 25/08/24.
//

import Foundation
import Firebase

protocol RegisterInteractorDelegate {
    func createUser()
}

class RegisterInteractor: UIViewController {
    
    let register = RegisterViewController()
    let registerPresenter = RegisterPresenter()
    
    var emailFromVC: String
    var passwordFromVC: String
    
    init(email: String, password: String) {
        self.emailFromVC = email
        self.passwordFromVC = password
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUser() {
        let loginViewController = LoginViewController()
        let email = emailFromVC
        let password = passwordFromVC
        
        Auth.auth().createUser(withEmail: email, password: password) { [self] authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                registerPresenter.callViewController()
            }            
        }
    }
}
