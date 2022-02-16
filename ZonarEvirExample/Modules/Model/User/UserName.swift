//
//  Inspector.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 15/02/2022.
//

import Foundation

public class UserName: NSObject {
    var firstName: String?
    var lastName: String?
    public override init() {
        super.init()
    }
    public convenience init (firstName: String, lastName: String) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
    }
}
