//
//  DetailViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 17/08/24.
//

import UIKit
import CoreData

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
    
    private let registerBillButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.setTitle("Cadastrar", for: .normal)
        return button
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
        view.addSubview(registerBillButton)
        
        NSLayoutConstraint.activate([
            expiration.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            expiration.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:  -30),
            expiration.widthAnchor.constraint(equalToConstant: 200),
            
            valueBill.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            valueBill.centerYAnchor.constraint(equalTo: expiration.bottomAnchor, constant: 30),
            valueBill.widthAnchor.constraint(equalToConstant: 200),
            
            registerBillButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerBillButton.centerYAnchor.constraint(equalTo: valueBill.bottomAnchor, constant: 30)
            
        ])
    }
    
    @objc func registerButtonTapped() {
        let detailViewInteractor = DetailViewInteractor(value: getValue(), expiration: getExpiration())
        detailViewInteractor.registerData(value: getValue(), expiration: getExpiration())
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
