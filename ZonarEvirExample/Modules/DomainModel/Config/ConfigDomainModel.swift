//
//  ConfigDomainModel.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//

import Foundation

struct ConfigDetail {
    var assetType: String
    var defectType: DefectType
    var id: UUID
    var inspectionType: InspectionType
    var inspectorName: UserName
    var lastInspectionDayBefore: Int
}
protocol ConfigDomainModelProtocol {
    
    var configRepository: ConfigRepositoryProtocol {get}
    
    func getConfigById(id: UUID)  -> Config?
    
    func getAllConfigs() -> [Config]?
    
    func getConfigDetail(config: Config)  -> ConfigDetail
    
    func getAllConfigDetails() -> [ConfigDetail]
    
    //Use for staging
    func createTestInstanceCoreData()
    
    func insertConfig(configParameter: ConfigParameters)
}

final class ConfigDomainModel:ConfigDomainModelProtocol {

    
    
    private(set) var configRepository: ConfigRepositoryProtocol
    
    init(configRepository: ConfigRepositoryProtocol = ConfigRepository()) {
        self.configRepository = configRepository
    }
    
    func getConfigById(id: UUID) -> Config? {
        return configRepository.getConfigByIdFromDB(configId: id)
    }
    
    func getAllConfigs() -> [Config]? {
        return configRepository.getAllConfigsFromDB()
    }
    
    func getConfigDetail(config: Config) -> ConfigDetail {
        return ConfigDetail(assetType: config.assetType ?? "",
                            defectType: DefectType(rawValue: config.defectType!) ?? DefectType.noDefect,
                            id: config.id ?? UUID(),
                            inspectionType: InspectionType(rawValue: config.inspectionType!) ?? InspectionType.preTrip,
                            inspectorName: config.inspectorName ?? UserName(firstName: "Test-FN", lastName: "Test-LN"),
                            lastInspectionDayBefore: Int(config.lastInspectionDayBefore))
    }
    
    func getAllConfigDetails() -> [ConfigDetail] {
        let configs = getAllConfigs()
        var configDetails = [ConfigDetail]()
        if let configs = configs {
            for config in configs {
                configDetails.append(getConfigDetail(config: config))
            }
        }
        return configDetails
    }
    //Use for staging
    func createTestInstanceCoreData() {
        return configRepository.createTestInstanceCoreData()
    }
    func insertConfig(configParameter: ConfigParameters){
        configRepository.insertConfig(configParameter: configParameter)
    }
}


