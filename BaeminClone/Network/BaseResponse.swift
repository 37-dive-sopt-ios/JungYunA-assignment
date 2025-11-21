//
//  BaseResponse.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/22/25.
//

import Foundation

public struct BaseResponse<T: Decodable>: Decodable {
    public let success: Bool
    public let code: String?
    public let message: String?
    public let data: T?
}

public struct EmptyResponse: Decodable {
    public init() {}
}
