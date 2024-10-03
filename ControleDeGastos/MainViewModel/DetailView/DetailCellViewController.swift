//
//  DetailViewController.swift
//  ControleDeGastos
//
//  Created by Joao on 17/08/24.
//

import Foundation
import UIKit

class DetailCellViewController: UIViewController {
    
    var selectedItemIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let index = selectedItemIndex {
            self.title = "Detalhes do Item \(index)"
        }
    }
}
