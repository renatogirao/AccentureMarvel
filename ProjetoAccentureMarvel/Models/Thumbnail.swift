//
//  Thumbnail.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 16/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import Foundation

struct Thumbnail : Codable {
    let path : String
    let ext : String
    
    var url: String {
        return path + "." + ext
        
    }
    
    enum CodingKeys : String, CodingKey {
        case path
        case ext = "extension"
        
    }
}
