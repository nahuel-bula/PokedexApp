//
//  UserDefaults+Pokedex.swift
//  Pokedex
//
//  Created by Nahuel Bula on 14/2/24.
//

import Foundation

extension UserDefaults {
    public func setStructArray<T: Codable>(_ value: [T], forKey defaultName: String) {
        let data = value.map { try? ApiEncoder().encode($0) }
        
        set(data, forKey: defaultName)
    }
    
    public func structArrayData<T>(_ type: T.Type, forKey defaultName: String) -> [T] where T : Decodable {
        guard let encodedData = array(forKey: defaultName) as? [Data] else {
            return []
        }
        
        return encodedData.compactMap {
            do {
                return try ApiDecoder().decode(type, from: $0)
            } catch {
                return nil
            }
        }
    }
}
