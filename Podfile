# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ProjetoAccentureMarvel' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ProjetoAccentureMarvel

  pod 'Alamofire', '~> 4.7'
  pod 'Kingfisher', '~> 4.0'
  pod 'SwiftHash'

end

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
