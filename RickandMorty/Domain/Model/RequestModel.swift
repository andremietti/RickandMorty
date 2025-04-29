//
//  RequestModel.swift
//  RickandMorty
//
//  Created by andre mietti on 29/04/25.
//

import Foundation

typealias ReqModel = RequestModel

struct RequestModel: Decodable {
    var results: [Character]
    var info: ResultInfo
}
