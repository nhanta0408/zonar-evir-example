//
//  LastInspectionViewModel.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 22/02/2022.
//

import Foundation

class LastInspectionViewModel {
    private let inspectedAssetDomainModel: InspectedAssetDomainModelProtocol
    
    var currentLastInspectedAsset: InspectedAsset!
    
    init(inspectedAssetDomainModel: InspectedAssetDomainModelProtocol = InspectedAssetDomainModel() ) {
        self.inspectedAssetDomainModel = inspectedAssetDomainModel
        getCurrentLastInspectedAsset()
    }
    
    func getCurrentLastInspectedAsset() {
        currentLastInspectedAsset = inspectedAssetDomainModel.getLastInspectedAsset()
    }
    
    
}
