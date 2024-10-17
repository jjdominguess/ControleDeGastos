//
//  DetailInteractor.swift
//  ControleDeGastos
//
//  Created by Joao Jose Domingues Silva (P) on 15/10/24.
//

import Foundation
import CoreData

class DetailViewInteractor {
    
    let coreDataManager = CoreDataManager()
    
    var value: String?
    var expiration: String?
    
    init(value: String, expiration: String) {
        self.value = value
        self.expiration = expiration
    }
    
    func registerData(value: String, expiration: String) {
        print(value)
        print(expiration)
        coreDataManager.saveData(value: value, expiration: expiration)
        //coreDataManager.createValues(billValue: value, billExpiration: expiration)

    }
    
    
}
