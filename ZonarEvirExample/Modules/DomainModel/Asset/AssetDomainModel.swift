//
//  AssetDomainModel.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//
import Foundation

protocol AssetDomainModelProtocol {
    var assetRepository: AssetRepositoryProtocol {get}
    
    func getAssetById(id: UUID) -> Asset?
    
}

final class AssetDomainModel:AssetDomainModelProtocol {
    
    private(set) var assetRepository: AssetRepositoryProtocol
    
    init(assetRepository: AssetRepositoryProtocol = AssetRepository()) {
        self.assetRepository = assetRepository
    }
    
    func getAssetById(id: UUID) -> Asset? {
        return assetRepository.getAssetByIdFromDB(assetId: id)
    }
}
