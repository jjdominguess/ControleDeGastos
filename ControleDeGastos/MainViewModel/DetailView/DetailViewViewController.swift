//
//  DetailViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 17/08/24.
//

import Foundation
import UIKit

class DetailViewViewController: UIViewController {
    
    var selectedItemIndex: Int?
    
    private let viewLayout: UIView = {
        let views = UIView()
        views.backgroundColor = .gray
        return views
    }()
    
    private let expiration: UITextField = {
        let vencimento = UITextField()
        vencimento.translatesAutoresizingMaskIntoConstraints = false
        vencimento.placeholder = "Vencimento"
        vencimento.borderStyle = .roundedRect
        return vencimento
    }()
    
    private let valueBill: UITextField = {
        let valor = UITextField()
        valor.translatesAutoresizingMaskIntoConstraints = false
        valor.placeholder = "Valor da Conta"
        valor.borderStyle = .roundedRect
        return valor
    }()
    
    private let botaoCadastrar: UIButton = {
        let botaoCadastrar = UIButton()
        botaoCadastrar.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return botaoCadastrar
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        if let index = selectedItemIndex {
            self.title = "Detalhes do Item \(index)"
        }
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(expiration)
        view.addSubview(valueBill)
        view.addSubview(viewLayout)
        
        NSLayoutConstraint.activate([
            expiration.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            expiration.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:  -30),
            expiration.widthAnchor.constraint(equalToConstant: 200),
            
            valueBill.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            valueBill.centerYAnchor.constraint(equalTo: expiration.bottomAnchor, constant: 30),
            valueBill.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func registerButtonTapped() {
        let detailViewInteractor = DetailViewInteractor(value: getValue(), expiration: getExpiration())
    }
    
    //MARK: - Pega valores dos campos de texto
    
    func getValue() -> String {
        let value = valueBill.text ?? ""
        return value
    }
    
    func getExpiration() -> String {
        let expiration = expiration.text ?? ""
        return expiration
    }
    
}
