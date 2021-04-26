//
//  APIRoute.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import Foundation

enum APIRoute {
    case characters

    var path: String {
        let commonPath = "https://breakingbadapi.com/api/characters"

        switch self {
        case .characters:
            return commonPath
        }
    }

    var url: URL {
        switch self {
        case .characters:
            return URL(string: self.path)!
        }
    }
}
