//
//  LocalStore.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//

import Foundation
import CoreData

private var privateStore: PrivateLocalStore!

fileprivate final class PrivateLocalStore: NSObject{
    private let container: NSPersistentContainer
    fileprivate lazy var viewContext: NSManagedObjectContext = {
        return container.viewContext
    }()
    
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "ZonarEvirExample")
        let description = NSPersistentStoreDescription()
        if inMemory {
            description.type = NSInMemoryStoreType
        }
        else{
            description.shouldMigrateStoreAutomatically = true
            description.shouldInferMappingModelAutomatically = true
        }
        container.persistentStoreDescriptions += [description]
        container.loadPersistentStores{
            _, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    @discardableResult
    fileprivate func saveMainContext() -> Bool {
        guard viewContext.hasChanges else {
            return false
        }
        viewContext.automaticallyMergesChangesFromParent = true
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        do {
            try viewContext.save()
            return true
        }
        catch{
            print("Error save main Context")
            return false
        }
    }
}

final class LocalStore: DataStoreProtocol {
    var context: NSManagedObjectContext {
        privateStore.viewContext
    }
    
    init(inMemory: Bool = false){
        privateStore = PrivateLocalStore(inMemory: inMemory)
    }
}

extension LocalStore: DataProtocol{
    
    @discardableResult func saveToDb() throws -> Bool {
        return privateStore.saveMainContext()
    }
    
    func get<Element: NSManagedObject>(predicate: NSPredicate) throws -> [Element] {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Element.fetch()
        
        let predicate = predicate
        fetchRequest.predicate = predicate
        
        return try privateStore.viewContext.fetch(fetchRequest) as! [Element]
    }
}
extension LocalStore: ConfigDataProtocol {
    func getConfigById(configId: UUID) throws -> Config? {
        let predicate = NSPredicate(format: "id == %@", configId.uuidString)
        let configs = try get(predicate: predicate) as! [Config]
        
        if !configs.isEmpty {
            return configs[0]
        }else{
            return nil
        }
    }
}
extension LocalStore: AssetDataProtocol {
    func getAssetById(assetId: UUID) throws -> Asset? {
        let predicate = NSPredicate(format: "id == %@", assetId.uuidString)
        let assets = try get(predicate: predicate) as! [Asset]
        
        if !assets.isEmpty {
            return assets[0]
        }else{
            return nil
        }
    }
}

