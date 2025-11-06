//
//  ResultInfo.swift
//  RickandMorty
//
//  Created by andre mietti on 29/04/25.
//

import Foundation

struct ResultInfo: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct info: Decodable {
    var test: ResultInfo
}
