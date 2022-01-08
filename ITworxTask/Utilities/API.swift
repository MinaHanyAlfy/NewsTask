//
//  API.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-08.
//

import Foundation
enum API{
    case getDefault(code: String)
    case getDefultWithOneCat(code: String,category: String)
    case getDefultWithTwoCat(code: String,category: String,secCategory: String)
    case getDefultWithThreeCat(code: String,category: String,secCategory: String,thirCategory: String)
}

extension API: EndPoint{
    var urlSubFolder: String {
        return "/v2/top-headlines"
    }
    
    var path: String {
        return ""
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getDefault(let code):
            return [URLQueryItem(name: "country", value: code)]
        case .getDefultWithOneCat(let code,let category):
            return [URLQueryItem(name: "country", value: code),URLQueryItem(name: "category", value: category)]
        case .getDefultWithTwoCat(let code,let category,let secCategory):
            return [URLQueryItem(name: "country", value: code),URLQueryItem(name: "category", value: category),URLQueryItem(name: "category", value: secCategory)]
        case.getDefultWithThreeCat(let code,let category,let secCategory,let thirdCategory):
            return [URLQueryItem(name: "country", value: code),URLQueryItem(name: "category", value: category),URLQueryItem(name: "category", value: secCategory),URLQueryItem(name: "category", value: thirdCategory)]
        }
    }
    
    var baseURL: String {
        return "https://newsapi.org"
        
    }
    
    var method: HTTPMethod {
        switch self {
        case .getDefault ,.getDefultWithOneCat ,.getDefultWithTwoCat,.getDefultWithThreeCat:
        return .get
    }
    }
}
