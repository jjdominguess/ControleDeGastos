//
//  RegisterPresenter.swift
//  ControleDeGastos
//
//  Created by Joao on 12/09/24.
//

import Foundation

protocol RegisterPresenterDelegate {
    func callViewController()
}

class RegisterPresenter: RegisterPresenterDelegate {
    
    let registerViewController = RegisterViewController()
    
    func callViewController() {
        print("Registro concluído.")
        
        registerViewController.buttonCreateTapped()
    }
}
