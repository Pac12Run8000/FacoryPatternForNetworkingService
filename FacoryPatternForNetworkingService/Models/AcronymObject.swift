//
//  AcronymObject.swift
//  FacoryPatternForNetworkingService
//
//  Created by Michelle Grover on 3/5/23.
//

import Foundation


import Foundation

struct AcronymElement:Codable {
    var sf:String
    var lfs:[LF]
}

struct LF:Codable {
     let lf: String
     let freq: Int
     let since: Int
     let vars: [LF]?
}

typealias AcronymObject = [AcronymElement]
