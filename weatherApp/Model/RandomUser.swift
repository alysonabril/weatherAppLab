//
//  RandomUser.swift
//  weatherApp
//
//  Created by Alyson Abril on 8/28/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import Foundation

//name and email address. Selecting a user should segue to a detailVC showing their full address, phone number, and date of birth.
struct RandomUser: Codable {
    let results: [Results]
    
    static func getUser(from data: Data) throws -> [Results] {
        do {
            let userInfo = try JSONDecoder().decode(RandomUser.self, from: data)
            return userInfo.results
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct Results: Codable {
    let name: Name
    let location: Location
    let email: String
    let dob: DOB
    let phone: String
    
    
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
    }
    
    struct Location: Codable {
        let street: String
        let city: String
        let state: String
//        let postcode: String
    }
    
    struct DOB: Codable {
        let date: String
    }
}


