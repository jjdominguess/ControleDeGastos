//
//  DataModelManager.swift
//  ControleDeGastos
//
//  Created by Joao Jose Domingues Silva (P) on 16/10/24.
//

import Foundation
import CoreData
import UIKit

//classe criada para fazer referencia ao Container do CoreData

class CoreDataManager {
     
    static let shared = CoreDataManager()
    let appDelegate = AppDelegate()
    
    let persistentContainer: NSPersistentContainer = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate not found!")
        }
        return appDelegate.persistentContainer
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    //MARK: - CRUD
    
//    func createValues(billValue: String, billExpiration: String) {
//        print(billValue)
//        print(billExpiration)
//        let newValue = Entity(context: CoreDataManager.shared.context)
//        newValue.value = billValue
//        newValue.expiration = billExpiration
//        
//        appDelegate.saveContext()
//    }
    func saveData(value: String, expiration: String) {
        print(value)

        let context = persistentContainer.viewContext
        let savedData = Entity(context: context)
        
        savedData.expiration = expiration
        savedData.value = value
        
        do {
            try context.save()
            print("Dados salvos com sucesso.")
        } catch {
            print("Erro ao salvar dados \(error)")
        }
    }
    
    func fetchValues() -> [Entity]? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        
        do {
            let entities = try context.fetch(fetchRequest)
            return entities
        } catch {
            print("Erro ao buscar usuários: \(error)")
            return nil
        }
        
    }
    
    func updateValues(values: String, expiration: String) {
        let context = persistentContainer.viewContext
        fetchValues()
        
    }
    
    func deleteValues() {
        
    }
    
    
}
