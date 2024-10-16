//
//  DataModelManager.swift
//  ControleDeGastos
//
//  Created by Joao Jose Domingues Silva (P) on 16/10/24.
//

import Foundation
import CoreData

//classe criada para fazer referencia ao Container do CoreData

class DataModelManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        self.persistentContainer = NSPersistentContainer(name: "ControleDeGastos")
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("Error Loading \(error)")
            }
        }
    }
}
