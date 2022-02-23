//
//  Constants.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 14/02/2022.
//

import Foundation

enum InspectionType: String {
    case preTrip = "Pre-Trip DOT"
    case postTrip = "Post-Trip DOT"
    case timeCard = "Time Card"
}
enum DefectType: String {
    case majorDefect = "Major"
    case minor = "Minor"
    case noDefect = "No"
}

enum DefectTypeInt: Int {
    case trivial = 63
    case minor = 127
    case major = 255
}

enum LastInspectedViewString: String {
    case inspectionType = "Inspection Type: "
    case inspectedBy = "Inspected by: "
    case timestamp = "Timestamp: "
    case duration = "Duration: "
    case lastReviewedBy = "Last reviewed by: "
}
