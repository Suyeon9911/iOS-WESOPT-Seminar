//
//  LoginResponseDataModel.swift
//  29th-4week-seminar-practice
//
//  Created by 김수연 on 2021/11/02.
//
// 로그인 request에 대한 response를 담을 파일

import Foundation

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData? // 서버에서 보내주는 응답 바디가 성공일 경우에는 data 객체가 잇지만, 실패일 경우에는 없음. -> 옵셔널로 선언 
}

// MARK: - LoginResultData
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}

// Codable :  데이터를 JSON 데이터 포맷으로 자유롭게 디코딩, 인코딩 할수 있도록해주는 프로토콜
