//
//  NetworkResult.swift
//  29th-4week-seminar
//
//  Created by 김수연 on 2021/10/30.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
