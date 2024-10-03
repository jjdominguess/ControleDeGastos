//
//  PresenterViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 12/09/24.
//

import Foundation
import UIKit

protocol LoginPresenterDelegate {
    func loginSucess()
    func loginError(error: Error)
}

class LoginPresenter: LoginPresenterDelegate {
    var loginViewController: LoginViewControllerDelegate?
 
    func loginSucess() {
        print("Autenticação realizada com sucesso.")
        loginViewController?.pushCollectionView()
    }
    
    func loginError(error: Error) {
        print(error)
    }
}
