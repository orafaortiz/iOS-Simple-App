//
//  ResponseCodables.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 17/02/22.
//

import Foundation

struct ServiceError: Error,Codable {
    let httpStatus: Int
    let message: String
}

