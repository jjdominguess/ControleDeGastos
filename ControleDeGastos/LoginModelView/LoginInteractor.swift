//
//  LoginInteractorController.swift
//  ControleDeGastos
//
//  Created by Joao on 17/08/24.
//

import FirebaseAuth

class LoginInteractor {
    
    var presenter: LoginPresenter?
    // preciso entender a diferença caso eu colocasse "var presenter: LoginPresente?"
    
    var email: String = ""
    var password: String = ""
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func emailValidate() {
        
        let email = email
        let password = password
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if let e = error {
                self.presenter?.loginError(error: e.localizedDescription as! Error)
            } else {
                self.presenter?.loginSucess()
            }
            
        }
    }
}
