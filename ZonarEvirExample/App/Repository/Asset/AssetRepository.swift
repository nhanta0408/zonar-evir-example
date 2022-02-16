//
//  AssetRepository.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//

import Foundation

protocol AssetRepositoryProtocol {
    var assetId: UUID? { get }
    
    func getAssetByIdFromDB(assetId: UUID) -> Asset?
}

final class AssetRepository: AssetRepositoryProtocol {
    
    
    private let dataSource: AssetDataProtocol
    private var assetResult: Asset?
    var assetId: UUID? {
        return assetResult?.id
    }
    
    init(dataSource: AssetDataProtocol = sharedLocalStore){
        self.dataSource = dataSource
    }
    
    public func getAssetByIdFromDB(assetId: UUID) -> Asset? {
        do {
            try assetResult = dataSource.getAssetById(assetId: assetId)
        } catch {
            print(error.localizedDescription)
        }
        return assetResult
    }
}
