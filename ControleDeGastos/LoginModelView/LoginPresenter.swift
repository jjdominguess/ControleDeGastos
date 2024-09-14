//
//  PresenterViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 12/09/24.
//

import Foundation
import UIKit

class LoginPresenter: UIViewController {
    var loginViewController: LoginViewController?
 
    func loginSucess() {
        print("Autenticação realizada com sucesso.")
        loginViewController?.pushCollectioView()
    }
    
    func loginError(error: Error) {
        print(error)
    }
}
