//
//  CollectionMainInteractor.swift
//  ControleDeGastos
//
//  Created by Joao Jose Domingues Silva (P) on 01/10/24.
//

import Foundation
import CoreData

protocol CollectionMainInteractorDelegate {
    func fetchValueToSendCell()
    
}

class CollectionMainInteractor {
    
    let collectionMainPresenter = CollectionMainPresenter()
    
//  TODO: entender como posso melhor a questão de passar uma informação corretamente pois estou fazendo casting que talvez seja desnecessário
    let coreDataManager = CoreDataManager()
    
    var dataArray: [String : String] = [:]
    
    func fetchValueToSendCell() -> [String : String] {
        dataArray = coreDataManager.fetchData()
        print(dataArray)
        return dataArray.first as! [String : String]
    }
}
