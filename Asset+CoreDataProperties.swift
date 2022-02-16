//
//  Asset+CoreDataProperties.swift
//  
//
//  Created by gcshcm on 16/02/2022.
//
//

import Foundation
import CoreData


extension Asset {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Asset> {
        return NSFetchRequest<Asset>(entityName: "Asset")
    }

    @NSManaged public var assetName: String?
    @NSManaged public var dot: Int64
    @NSManaged public var id: UUID?
    @NSManaged public var plate: String?
    @NSManaged public var vin: String?

}
