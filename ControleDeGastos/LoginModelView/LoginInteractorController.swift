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
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func emailValidate() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          // ...
        }
    }
}
