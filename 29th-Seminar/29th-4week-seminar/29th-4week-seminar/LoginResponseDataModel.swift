//
//  LoginResponseDataModel.swift
//  29th-4week-seminar
//
//  Created by 김수연 on 2021/10/30.
//

import Foundation

// MARK: - Login
struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - DataClass
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
