//
//  UserSignService.swift
//  29th-4week-seminar
//
//  Created by 김수연 on 2021/10/30.
//

import Foundation
import Alamofire

struct UserSignService{
    static let shared = UserSignService()
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        let url = APIConstants.loginURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    //get 방식
    func readUserData(userId: Int,
                      completion: @escaping (NetworkResult<Any>) -> (Void)){
        let url = APIConstants.readUserURL + "\(userId)"
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
        }
        }
        
//        dataRequest.responseData(completionHandler: { response in
//        })
    }

    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode{
        case 200: return isVaildLoginData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isVaildLoginData(data: Data) ->NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(LoginResponseData.self, from: data)
        else {return .pathErr}
        return .success(decodeData)
    }
}


