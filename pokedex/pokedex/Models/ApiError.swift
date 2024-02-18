//
//  ApiError.swift
//  Pokedex
//
//  Created by Nahuel Bula on 18/2/24.
//

import Foundation

enum ApiError: Int, Codable, Error {
    case badRequest = 400,
    unauthorized = 401,
    forbidden = 403,
    notFound = 404,
    parsing = 406,
    unprocessableEntity = 422,
    internalServer = 500,
    unknown = 999
    
    var defaultMessage: String {
        switch self {
        case .notFound: return localized("not_found_error")
        case .badRequest: return localized("bar_request_error")
        case .unauthorized: return localized("unauthorized_error")
        case .forbidden: return localized("forbidden_error")
        case .parsing: return localized("parsing_error")
        case .unprocessableEntity: return localized("not_found_error")
        case .internalServer: return localized("internal_server_error")
        default: return localized("unknown_error")
        }
    }
}
