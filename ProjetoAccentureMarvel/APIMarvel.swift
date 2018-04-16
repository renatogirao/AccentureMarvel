//
//  APIMarvel.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 15/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class APIMarvel {
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "a733ff0ab4c34ddf3669b9d5c43a0bd6c588eaeb"
    static private let publicKey = "82cf8e2b07809935fc84bb1f317a0af3"
    static private let limit = 50
    
    class func loadHeroes(name: String?, page: Int = 0, onComplete: @escaping (InfoMarvel?) -> Void) {
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
            
        } else {
            startsWith = ""
        }
        
        let url = basePath + "offset=\(offset)&limit=\(limit)&"+startsWith+getCredentials()
        print(url)
        
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data else {
                onComplete(nil)
                return }
                do {
                let marvelInfo = try? JSONDecoder().decode(InfoMarvel.self, from: data)
                onComplete(marvelInfo)
            } catch {
                print (error.localizedDescription )
                onComplete(nil)
            }
        }
    }
    
    
    private class func getCredentials() -> String {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
    
    
}
