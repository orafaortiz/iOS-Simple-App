//
//  Constants.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 17/02/22.
//

import Foundation

struct APIHeaders {
    static var kContentType = "Content-Type"
    static var contentTypeValue = "application/json"
}

struct APIEndpoints {
    static var posts = "/posts"
    static var albums = "/albums"
    static var todos = "/todos"
}

struct PlaceholderAPI {
    
    static var base = "https://jsonplaceholder.typicode.com"
    static var posts = base + "/posts"
    static var albums = base + "/albums"
}

enum MainMenuItems: String {
    case posts = "Posts"
    case albums = "Albums"
    case todos = "TO-DOs"
    
    static let allValues = [posts, albums, todos]
}
