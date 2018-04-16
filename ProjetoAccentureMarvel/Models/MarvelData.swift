//
//  MarvelData.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 16/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import Foundation

struct MarvelData : Codable {
    
    let offset : Int
    let limit : Int
    let total : Int
    let count : Int
    let results : [Hero]
    
}
