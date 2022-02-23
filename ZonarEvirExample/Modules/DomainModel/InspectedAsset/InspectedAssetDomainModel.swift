//
//  InspectedAssetDomainModel.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 22/02/2022.
//

import Foundation
struct InspectedAsset: Codable {
    var inspectionId: UUID
    var assetId: UUID
    var inspectionType: String
    var inspectedBy: String
    var timestamp: String //Se chuyen thanh DateTime sau
    var duration: String
    var lastReviewedBy: String
    var inspectedZones: [InspectedZone]
    
}
struct InspectedZone: Codable{
    var name: String
    var severity: Int
}
protocol InspectedAssetDomainModelProtocol {
    func getLastInspectedAsset() -> InspectedAsset
}

class InspectedAssetDomainModel: InspectedAssetDomainModelProtocol {
    func getLastInspectedAsset() -> InspectedAsset {
        //Fake data
        return FakeDataGenerator.shared.getSampleInspectedAsset() ?? InspectedAsset(inspectionId: UUID(),
                                                                                    assetId: UUID(),
                                                                                    inspectionType: "Unknown",
                                                                                    inspectedBy: "Unknown",
                                                                                    timestamp: "Unknown",
                                                                                    duration: "Unknown",
                                                                                    lastReviewedBy: "Unknown",
                                                                                    inspectedZones: [
                                                                                        InspectedZone(name: "Test", severity: 127)
                                                                                    ])
    }
}
