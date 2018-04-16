//
//  Hero.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 16/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import Foundation

struct Hero : Codable {
    let id : Int
    let name : String
    let description  : String
    let thumbnail : Thumbnail
    let urls : [HeroURL]
    
}

