//
//  SignInInteractor.swift
//  ControleDeGastos
//
//  Created by Joao on 25/08/24.
//

import Foundation
import Firebase

class RegisterInteractor: UIViewController {
    
    
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
    
    let register = RegisterViewController()
    
    func createUser() {
        let loginViewController = LoginViewController()
        let email = emailFromVC
        let password = passwordFromVC
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                print("Registro concluído.")
                
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(loginViewController, animated: true)
                }
            }            
        }
    }
}
