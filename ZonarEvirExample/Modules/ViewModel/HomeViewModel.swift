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
        //return configDomainModel.createTestInstanceCoreData()
        let isExistedInstance = getAllConfigs().count != 0
        if !isExistedInstance {
//            let config = Config()
//            config.lastInspectionDayBefore = 0
//            config.inspectorName = UserName(firstName: "Test-FN", lastName: "Test-LN")
//            config.inspectionType = InspectionType.preTrip.rawValue
//            config.defectType = DefectType.majorDefect.rawValue
            configDomainModel.insertConfig(configParameter: {
                $0.id = UUID()
                $0.lastInspectionDayBefore = 0
                $0.inspectorName = UserName(firstName: "Test-FN", lastName: "Test-LN")
                $0.inspectionType = InspectionType.preTrip.rawValue
                $0.defectType = DefectType.majorDefect.rawValue
            })

//            let asset = Asset()
//            asset.vin = "DEFAULT-VIN"
//            asset.plate = "DEFAULT-PLATE"
//            asset.dot = 0
//            asset.assetName = "TEST FLEET"
            assetDomainModel.insertAsset(assetParameter: {
                $0.id = UUID()
                $0.vin = "DEFAULT-VIN"
                $0.plate = "DEFAULT-PLATE"
                $0.dot = 0
                $0.assetName = "TEST FLEET"
            })
        }
    }
    
}
