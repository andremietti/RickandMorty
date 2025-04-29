//
//  APIEndPoint.swift
//  RickandMorty
//
//  Created by andre mietti on 25/04/25.
//

import Foundation
import Networking

import ObjectiveC

public var parametersKey: [String: String]?

enum APIEndPoint {
    case character
    case location
    case episode
}

extension APIEndPoint: EndPoint {
    
    var host: String {
        return "rickandmortyapi.com"
    }
    
    var scheme: String {
        return "https"
    }
    
    var path: String {
        switch self {
        case .character:
            return "/api/character"
        case .location:
            return "/api/location"
        case .episode:
            return "/api/episode"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .character, .episode, .location:
            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : String]? {
        return nil
    }
    
    var parameters: [String: String]? {
        return parametersKey
    }
        
    public mutating func setParam(params: [String: String]) {
        parametersKey = params
    }
}

extension NetworkError: @retroactive CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        default:
            return "Unknown Error"
        }
    }
}
