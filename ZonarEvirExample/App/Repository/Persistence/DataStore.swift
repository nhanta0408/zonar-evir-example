//
//  DataStore.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//

import Foundation
import CoreData

protocol DataStoreProtocol {
    init(inMemory: Bool)
}

protocol DataProtocol: DataStoreProtocol {
    @discardableResult func saveToDb() throws -> Bool
    func get<Element: NSManagedObject>(predicate: NSPredicate) throws -> [Element]
}

protocol ConfigDataProtocol: DataProtocol {
    func getConfigById(configId: UUID) throws -> Config?
}

protocol AssetDataProtocol: DataProtocol {
    func getAssetById(assetId: UUID) throws -> Asset?
}
