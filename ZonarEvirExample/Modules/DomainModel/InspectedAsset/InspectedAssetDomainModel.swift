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
                                                                                    inspectedZones: [
                                                                                        InspectedZone(name: "Test", severity: 127)
                                                                                    ])
    }
}
