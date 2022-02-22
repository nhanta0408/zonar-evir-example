//
//  FakeDataGenerator.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 22/02/2022.
//

import Foundation

final class FakeDataGenerator {
    typealias DecoderObject  = NSObject & Codable
    
    static let  shared = FakeDataGenerator()
    func getJSON_Data(fileName: String) -> Data? {
       if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
           do {
                 let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                 return data
             } catch {
                  // handle error
                   print("error, not found")
             }
       }
       return nil
   }
    
    func getSampleInspectedAsset() -> InspectedAsset? {
        let inspectedAssetData = FakeDataGenerator.shared.getJSON_Data(fileName: "lastInspection")
        do {
            let result = try JSONDecoder().decode(InspectedAsset.self, from: inspectedAssetData ?? Data())
            return result
        } catch {
            return nil
        }
    }
}
