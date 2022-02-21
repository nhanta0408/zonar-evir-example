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
    
    struct HomeViewControllerData{
        var assetDetails: [AssetDetail]
        var configDetails: [ConfigDetail]
    }
    
    init(configDomainModel: ConfigDomainModelProtocol = ConfigDomainModel(),
         assetDomainModel: AssetDomainModelProtocol = AssetDomainModel()) {
        self.configDomainModel = configDomainModel
        self.assetDomainModel = assetDomainModel
    }
    
    //MARK: Variable for update UI
    let helloMessage = "Hello Test Hard code"
    //MARK: CONFIG
    func getAllConfigs() -> [ConfigDetail] {
        return configDomainModel.getAllConfigDetails()
    }
    
    
    //MARK: ASSET
    
    func getAllAssets() -> [AssetDetail] {
        return assetDomainModel.getAllAssetDetails()
    }
    func getCountOfAllAssetDetails() -> Int {
        return getAllAssets().count
    }

    //Use for staging
    func createTestInstanceCoreData() {
        //return configDomainModel.createTestInstanceCoreData()
        let isExistedInstance = getAllConfigs().count != 0
        if !isExistedInstance {

            configDomainModel.insertConfig(configParameter: {
                $0.id = UUID()
                $0.lastInspectionDayBefore = 0
                $0.inspectorName = UserName(firstName: "Nhan", lastName: "Ta")
                $0.inspectionType = InspectionType.preTrip.rawValue
                $0.defectType = DefectType.majorDefect.rawValue
            })
//            configDomainModel.insertConfig(configParameter: {
//                $0.id = UUID()
//                $0.lastInspectionDayBefore = 2
//                $0.inspectorName = UserName(firstName: "Nhan", lastName: "Ta")
//                $0.inspectionType = InspectionType.preTrip.rawValue
//                $0.defectType = DefectType.noDefect.rawValue
//            })


            assetDomainModel.insertAsset(assetParameter: {
                $0.id = UUID()
                $0.vin = "DEFAULT-VIN"
                $0.plate = "DEFAULT-PLATE"
                $0.dot = 0
                $0.assetName = "TEST FLEET"
            })
//            assetDomainModel.insertAsset(assetParameter: {
//                $0.id = UUID()
//                $0.vin = "DEFAULT-VIN-2"
//                $0.plate = "DEFAULT-PLATE-2"
//                $0.dot = 0
//                $0.assetName = "TEST FLEET 2"
//            })
        }
    }
    
}
