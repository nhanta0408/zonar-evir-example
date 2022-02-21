//
//  AssetDomainModel.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//
import Foundation

struct AssetDetail {
    var assetName: String
    var dot: Int
    var id: UUID
    var plate: String
    var vin: String
}
protocol AssetDomainModelProtocol {
    var assetRepository: AssetRepositoryProtocol {get}
    
    func getAssetById(id: UUID) -> Asset?
    func getAllAssets() -> [Asset]?
    func insertAsset(assetParameter: AssetParameters)
    func getAssetDetail(asset: Asset) -> AssetDetail
    func getAllAssetDetails() -> [AssetDetail]
}

final class AssetDomainModel:AssetDomainModelProtocol {
    
    private(set) var assetRepository: AssetRepositoryProtocol
    
    init(assetRepository: AssetRepositoryProtocol = AssetRepository()) {
        self.assetRepository = assetRepository
    }
    
    func getAssetById(id: UUID) -> Asset? {
        return assetRepository.getAssetByIdFromDB(assetId: id)
    }
    func getAllAssets() -> [Asset]? {
        return assetRepository.getAllAssetsFromDB()
    }
    func insertAsset(assetParameter: AssetParameters){
        assetRepository.insertAsset(assetParameter: assetParameter)
    }
    func getAssetDetail(asset: Asset) -> AssetDetail {
        return AssetDetail(assetName: asset.assetName ?? "",
                           dot: Int(asset.dot) ,
                           id: asset.id ?? UUID(),
                           plate: asset.plate ?? "",
                           vin: asset.vin ?? ""
        )
    }
    func getAllAssetDetails() -> [AssetDetail] {
        let assets = getAllAssets()
        var assetDetails = [AssetDetail]()
        if let assets = assets {
            for asset in assets {
                assetDetails.append(getAssetDetail(asset: asset))
            }
        }
        return assetDetails
    }
}
