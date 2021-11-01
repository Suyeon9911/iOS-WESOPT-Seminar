//
//  APIConstants.swift
//  29th-4week-seminar-practice
//
//  Created by 김수연 on 2021/11/02.
//
// 요청서 -> 어디에? 보낼지 해당하는 URL 관리하기 쉽게 API 주소를 모아놓는 파일

import Foundation
struct APIConstants {
    //MARK: Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    //MARK: Feature URL
    // api마다 필요한 경로에 따라 변수를 추가하는 부분
    static let loginURL = baseURL + "/user/login"
    
}
