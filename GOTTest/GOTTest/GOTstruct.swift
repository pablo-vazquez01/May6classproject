//
//  File.swift
//  GOTTest
//
//  Created by Mac Consultant on 5/17/19.
//  Copyright © 2019 Mac Consultant. All rights reserved.
//

import Foundation

struct GOT: Codable{
    let _embedded: GOTepisodes
}

struct GOTepisodes: Codable{
    let episodes: [GOTcellData]
}

struct GOTcellData: Codable {
    let season: Int
    let episode: Int
    let episodeName: String
    let summary: String
    let premier: String
    let airtime: String
    
    enum CodingKeys:String, CodingKey{
        case season
        case episode = "number"
        case episodeName = "name"
        case summary
        case premier = "airdate"
        case airtime
    }
}
