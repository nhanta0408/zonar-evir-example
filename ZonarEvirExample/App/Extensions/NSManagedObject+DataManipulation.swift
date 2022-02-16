//
//  NSManagedObject+DataManipulation.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//

import Foundation
import CoreData

extension NSManagedObject{
    
    static func fetch() -> NSFetchRequest<NSFetchRequestResult> {
        let entityName = String(describing: self)
        return NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    }
}
