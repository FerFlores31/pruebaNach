//
//  json.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import Foundation

struct ChartObject : Codable {
    var colors : [String]?
    var questions : [Question]?
}


struct Question : Codable {
    var total : Int?
    var text : String?
    var chartData : [CharData]?
}

struct CharData : Codable {
    var text : String?
    var percetnage : Int?
    
}
