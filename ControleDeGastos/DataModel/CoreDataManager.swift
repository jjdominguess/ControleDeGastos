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
protocol CoreDataManagerDelegate {
    func saveData()
    func fetchValues()
    func deleteData()
    func fetchSpefificData()
    func deleteAllData()
}

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
    
    func fetchData() -> [String : String] {
        //TODO: Entender se dá para passar de melhor forma esse valor pego no banco de dados, pois parece gambiarra KKK
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        var dataArray: [String : String] = [:]
        
        do {
            let results = try context.fetch(fetchRequest) as [Entity]
            
            for entity in results {
                if let value = entity.value, let expiration = entity.expiration {
                    dataArray[expiration] = value
                }
            }
            print(dataArray)
        } catch {
            print("Erro ao buscar usuários: \(error)")
        }
        return dataArray
    }
    
//    func fetchSpecificData(expirationValue: String) -> Array<NSFetchRequestResult> {
//        let context = persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
//        fetchRequest.fetchLimit = 1
//        
//        var returnToOutputString: Array<NSFetchRequestResult>?
//        
//        fetchRequest.predicate = NSPredicate(format: "expiration  == %@", expirationValue)
//
//        do {
//            let results = try context.fetch(fetchRequest)
////            for entity in results {
////                var expirationValue = String(describing: entity.value)
////            }
//            returnToOutputString = results
//        } catch {
//            print("Erro ao buscar dados: \(error)")
//        }
//        return returnToOutputString!
//    }
    
    func deleteData(entity: Entity) {
    // TODO: criar método para deletar valores
        let context = persistentContainer.viewContext
        context.delete(entity)
        
        do {
            try context.save()
            print("Usuário deletado com sucesso!")
        } catch {
            print("Erro ao deletar usuário: \(error)")
        }
    }
    
    func deleteAllData() {
        let  context = persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Entity.fetchRequest()
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            print("Todos os dados da entidade foram apagados")
        } catch {
            print("Erro ao apagar os dados:\(error)")
        }
    }
    
}
