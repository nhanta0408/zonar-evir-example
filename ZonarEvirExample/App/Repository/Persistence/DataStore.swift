//
//  DataStore.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//

import Foundation
import CoreData
import Metal

protocol DataStoreProtocol {
    init(inMemory: Bool)
}

protocol DataProtocol: DataStoreProtocol {
    @discardableResult func saveToDb() throws -> Bool
    func get<Element: NSManagedObject>(predicate: NSPredicate) throws -> [Element]
    func getAll<Element: NSManagedObject>() throws -> [Element]
    func insert<Element: NSManagedObject>(entityModel: (Element) -> Void) throws
}

typealias ConfigParameters = (Config) -> Void
typealias AssetParameters = (Asset) -> Void


protocol ConfigDataProtocol: DataProtocol {
    func getConfigById(configId: UUID) throws -> Config?
    func getAllConfigs() throws -> [Config]
    func insertConfig(configParameter: ConfigParameters) throws
    func createTestInstanceCoreData()
}

protocol AssetDataProtocol: DataProtocol {
    func getAssetById(assetId: UUID) throws -> Asset?
    func getAllAssets() throws -> [Asset]
    func insertAsset(assetParameter: AssetParameters) throws
}
