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
    
    func getConfigById(id: UUID) -> Config {
        var configResult = configDomainModel.getConfigById(id: id)
        
        guard let configResult = configResult else {
            configResult = Config()
            configResult?.id = UUID()
            configResult?.lastInspectionDayBefore = 0
            configResult?.inspectorName = UserName(firstName: "Test-FN", lastName: "Test-LN")
            configResult?.inspectionType = InspectionType.preTrip.rawValue
            configResult?.defectType = DefectType.majorDefect.rawValue
            configResult?.assetType = "Tractor"
            return configResult!
        }
        return configResult
      

    }
    
    func getAssetById(id: UUID) -> Asset {
        var assetResult = assetDomainModel.getAssetById(id: id)
        
        guard let assetResult = assetResult else {
            assetResult = Asset()
            assetResult?.id = UUID()
            assetResult?.vin = "DEFAULT-VIN"
            assetResult?.plate = "DEFAULT-PLATE"
            assetResult?.dot = 0
            assetResult?.assetName = "TEST FLEET"
            return assetResult!
        }
        return assetResult
    }
}
