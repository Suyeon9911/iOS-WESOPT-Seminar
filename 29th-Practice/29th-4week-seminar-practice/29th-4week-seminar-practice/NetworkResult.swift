//
//  NetworkResult.swift
//  29th-4week-seminar-practice
//
//  Created by 김수연 on 2021/11/02.
//
// 서버 통신 결과를 처리하기 위한 파일 추가

import Foundation

enum NetworkResult<T> {
    case success(T) // 서버 통신 성공했을 때
    case requestErr(T) // 요청 에러 발생했을때
    case pathErr // 경로에러 발생했을 때
    case serverErr // 서버의 내부적 에러가 발생했을 때
    case networkFail // 네트워크 연결 실패했을 때
}

// <T>는 타입파라미터로 지금은 타입을 정해놓지 않고 해당 열거형이 불릴 때마다 타입을 결정

