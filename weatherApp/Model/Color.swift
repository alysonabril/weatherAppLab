//
//  Color.swift
//  weatherApp
//
//  Created by Alyson Abril on 8/28/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import Foundation

struct Color: Codable {
    let hex: Hex
    let rgb: RGB
    let name: Name
    
    static func getColor(from data: Data) throws -> Color {
        do {
            let colorInfo = try JSONDecoder().decode(Color.self, from: data)
            return  colorInfo
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct Hex: Codable {
    let value: String
}

struct RGB: Codable {
    let r: Int
    let g: Int
    let b: Int
}

struct Name: Codable {
    let value: String
}
