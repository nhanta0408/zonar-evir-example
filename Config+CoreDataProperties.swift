//
//  Config+CoreDataProperties.swift
//  
//
//  Created by gcshcm on 18/02/2022.
//
//

import Foundation
import CoreData


extension Config {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Config> {
        return NSFetchRequest<Config>(entityName: "Config")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var lastInspectionDayBefore: Int64
    @NSManaged public var inspectorName: UserName?
    @NSManaged public var inspectionType: String?
    @NSManaged public var defectType: String?
    @NSManaged public var assetType: String?

}
