//
//  Inspector.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 15/02/2022.
//

import Foundation

public final class UserName: NSObject {
//    var firstName: String = ""
//    var lastName: String = ""
//    lazy var fullName: String = {
//        return firstName + lastName
//    }()
//    public override init() {
//        super.init()
//    }
//    public convenience init (firstName: String, lastName: String) {
//        self.init()
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
    
    var firstName: String = ""
    var lastName: String = ""
    
    enum CodingKeys: String, CodingKey {
        case firstName = "firstName"
        case lastName = "lastName"
    }
    
    public init(firstName: String = "", lastName: String = "") {
        super.init()
        self.firstName = firstName
        self.lastName = lastName
   }
    
    public init?(coder aDecoder: NSCoder) {
        firstName = aDecoder.decodeObject(forKey:"firstName") as! String
        lastName = aDecoder.decodeObject(forKey:"lastName") as! String
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
    }
}
extension UserName: NSCoding {
    public func encode(with coder: NSCoder) {
        coder.encode(firstName, forKey: "firstName")
        coder.encode(lastName, forKey: "lastName")
    }
}

extension UserName: Codable {
    public func encode(to encoder: Encoder) throws { }
}
