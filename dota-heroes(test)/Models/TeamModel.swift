//
//  TeamModel.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 05.06.2022.
//

import Foundation

struct TeamModel: Decodable {
    let name: String
    let logo_url: String?
    let rating: Double
    let wins: Int
    let losses: Int
}
