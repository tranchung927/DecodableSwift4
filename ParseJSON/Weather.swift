//
//  Weather.swift
//  ParseJSON
//
//  Created by Tran Chung on 7/19/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import Foundation

struct Location: Decodable {
    let name: String
    let country: String
}
struct Current: Decodable {
    let condition: Condition
}

struct Condition: Decodable {
    let icon: String
}
struct Weather: Decodable {
    let location: Location
    let current: Current
}
