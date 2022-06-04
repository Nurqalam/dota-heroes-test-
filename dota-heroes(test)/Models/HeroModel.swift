//
//  HeroModel.swift
//  dota-heroes(test)
//
//  Created by Nurqalam on 04.06.2022.
//

import Foundation


struct HeroModel: Decodable {
    let localized_name: String
    let img: String
    let primary_attr: String
    let attack_type: String
    let base_health: Int
    let base_mana: Int
    let attack_range: Int
}
