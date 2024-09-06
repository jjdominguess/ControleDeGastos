//
//  LoginInteractorController.swift
//  ControleDeGastos
//
//  Created by Joao on 17/08/24.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth


class LoginInteractorController: UIViewController {
    //let loginViewController = LoginViewController()
    
    var email: String
    var password: String
    
    init(emailFromLVC: String, passwordFromLVC: String) {
        self.email = emailFromLVC
        self.password = passwordFromLVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func emailValidate() {
        
        let collectionMainViewController = CollectionMainViewController()
        let email = email
        let password = password
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let e = error {
                print(e.localizedDescription)
            } else {
                print("Autenticação realizada com sucesso.")
                self?.navigationController?.pushViewController(collectionMainViewController, animated: true)
            }
            
        }
    }
}
