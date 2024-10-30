//
//  CollectionMainPresenter.swift
//  ControleDeGastos
//
//  Created by Joao Jose Domingues Silva (P) on 01/10/24.
//

import Foundation

class CollectionMainPresenter {
    //let collectionMainViewController = CollectionMainViewController()
    let collectionMainInteractor = CollectionMainInteractor()
        
    func dataToSendCell() {
        collectionMainInteractor.dataArray

    }
}
