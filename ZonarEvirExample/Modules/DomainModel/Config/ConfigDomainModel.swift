//
//  ConfigDomainModel.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//

import Foundation

protocol ConfigDomainModelProtocol {
    var configRepository: ConfigRepositoryProtocol {get}
    
    func getConfigById(id: UUID)  -> Config?
    
}

final class ConfigDomainModel:ConfigDomainModelProtocol {
    
    private(set) var configRepository: ConfigRepositoryProtocol
    
    init(configRepository: ConfigRepositoryProtocol = ConfigRepository()) {
        self.configRepository = configRepository
    }
    
    func getConfigById(id: UUID) -> Config? {
        return configRepository.getConfigByIdFromDB(configId: id)
    }
}


