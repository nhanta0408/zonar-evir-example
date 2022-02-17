//
//  ConfigRepository.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//

import Foundation

protocol ConfigRepositoryProtocol {
    var configId: UUID? { get }
    
    func getConfigByIdFromDB(configId: UUID) -> Config?
    
    func getAllConfigsFromDB() -> [Config]?
    //Use for staging
    func createTestInstanceCoreData()
    
}

final class ConfigRepository: ConfigRepositoryProtocol {
    
    
    private let dataSource: ConfigDataProtocol
    private var configResult: Config?
    var configId: UUID? {
        return configResult?.id
    }
    
    init(dataSource: ConfigDataProtocol = sharedLocalStore){
        self.dataSource = dataSource
    }
    
    public func getConfigByIdFromDB(configId: UUID) -> Config? {
        do {
            try configResult = dataSource.getConfigById(configId: configId)
        } catch {
            print(error.localizedDescription)
        }
        return configResult
    }
    
    public func getAllConfigsFromDB() -> [Config]? {
        var configsResult: [Config]?
        do {
            try configsResult = dataSource.getAllConfigs()
        } catch {
            print(error.localizedDescription)
        }
        return configsResult
    }
    //Use for staging
    func createTestInstanceCoreData() {
        dataSource.createTestInstanceCoreData()
    }
}
