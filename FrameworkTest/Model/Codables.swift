//
//  Post.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 17/02/22.
//

import Foundation

struct Post: Codable {
    let id: Int
    let title, body: String
}

struct Album: Codable {
    let title: String
}

struct Todo: Codable {
    let title: String
    let completed: Bool
}
