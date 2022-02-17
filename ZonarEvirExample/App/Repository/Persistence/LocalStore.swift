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
            print(error)
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
    func getAll<Element: NSManagedObject>() throws -> [Element] {
        return (try privateStore.viewContext.fetch(Element.fetch()) as? [Element]) ?? []
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
    func getAllConfigs() throws -> [Config] {
        return try getAll()
    }
    
    func createTestInstanceCoreData() {
        do {
            // TODO: Check lại coi instance có save vô coreData thành công chưa
            let isExistedInstance = try getAllConfigs().count != 0
            if !isExistedInstance {
                let config = Config(context: context)
                config.id = UUID()
                config.lastInspectionDayBefore = 0
                config.inspectorName = UserName(firstName: "Test-FN", lastName: "Test-LN")
                config.inspectionType = InspectionType.preTrip.rawValue
                config.defectType = DefectType.majorDefect.rawValue
                config.assetType = "Tractor"
                
                let asset = Asset(context: context)
                asset.id = UUID()
                asset.vin = "DEFAULT-VIN"
                asset.plate = "DEFAULT-PLATE"
                asset.dot = 0
                asset.assetName = "TEST FLEET"
                
                try saveToDb()
                
            }
        } catch  {
            print(error.localizedDescription)
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
    func getAllAssets() throws -> [Asset] {
        return try getAll()
    }
}

