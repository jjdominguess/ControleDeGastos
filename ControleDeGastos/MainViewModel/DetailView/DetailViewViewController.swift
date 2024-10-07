//
//  DetailViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 17/08/24.
//

import Foundation
import UIKit

protocol DetailViewViewControllerDelegate {
    
}

class DetailViewViewController: UIViewController {
    
    let interactor = DetailViewInteractor()
    var selectedItemIndex: Int?
    
    private let textFieldValue: UITextField = {
        let text = UITextField()
        text.placeholder = "Valor"
        //text.widthAnchor.constraint(equalToConstant: 200).isActive = true
        text.heightAnchor.constraint(equalToConstant: 50).isActive = true
        text.translatesAutoresizingMaskIntoConstraints = false
        text.borderStyle = .roundedRect
        return text
    }()
    
    private let textFieldDate: UITextField = {
        let text = UITextField()
        text.placeholder = "Vencimento"
        text.heightAnchor.constraint(equalToConstant: 50).isActive = true
        text.translatesAutoresizingMaskIntoConstraints = false
        text.borderStyle = .roundedRect
        return text
    }()
    
    private let resgisterDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cadastrar conta.", for: .normal)
        //button.addTarget(self, action: #selector(registerData), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let index = selectedItemIndex {
            self.title = "Detalhes do Item \(index)"
        }
        
        setupLayout()
    }
    
    func setupLayout() {
        view.backgroundColor = .gray
        self.view.addSubview(textFieldValue)
        self.view.addSubview(textFieldDate)
        
        NSLayoutConstraint.activate([
            textFieldValue.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textFieldValue.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textFieldValue.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            textFieldDate.topAnchor.constraint(equalTo: textFieldValue.topAnchor, constant: 60),
            textFieldDate.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textFieldDate.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
    }
    
    
}
