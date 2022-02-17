//
//  HomeViewModel.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//

import Foundation

class HomeViewModel {
    private let configDomainModel: ConfigDomainModelProtocol
    private let assetDomainModel: AssetDomainModelProtocol
    
    init(configDomainModel: ConfigDomainModelProtocol = ConfigDomainModel(),
         assetDomainModel: AssetDomainModelProtocol = AssetDomainModel()) {
        self.configDomainModel = configDomainModel
        self.assetDomainModel = assetDomainModel
    }
    //MARK: CONFIG
    func getConfigById(id: UUID) -> Config? {
        return configDomainModel.getConfigById(id: id)
    }
    
    func getAllConfigs() -> [Config] {
        return configDomainModel.getAllConfigs() ?? []
    }
    
    
    //MARK: ASSET
    func getAssetById(id: UUID) -> Asset? {
        return assetDomainModel.getAssetById(id: id)
    }
    
    func getAllAssets() -> [Asset] {
        return assetDomainModel.getAllAssets() ?? []
    }
    func getCountOfAllAssets() -> Int {
        return getAllAssets().count
    }
    //Use for staging
    func createTestInstanceCoreData() {
        return configDomainModel.createTestInstanceCoreData()
    }
    
}
