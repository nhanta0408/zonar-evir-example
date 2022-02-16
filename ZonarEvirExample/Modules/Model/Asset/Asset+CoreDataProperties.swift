//
//  Asset+CoreDataProperties.swift
//  
//
//  Created by gcshcm on 15/02/2022.
//
//

import Foundation
import CoreData


extension Asset {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Asset> {
        return NSFetchRequest<Asset>(entityName: "Asset")
    }

    @NSManaged public var plate: Int64
    @NSManaged public var vin: Int64
    @NSManaged public var assetName: String?
    @NSManaged public var dot: Int64

}
