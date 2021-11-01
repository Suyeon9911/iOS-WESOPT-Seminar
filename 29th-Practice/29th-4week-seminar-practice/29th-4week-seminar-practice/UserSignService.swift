//
//  UserSignService.swift
//  29th-4week-seminar-practice
//
//  Created by 김수연 on 2021/11/02.
//
// 통신하는 파일

import Foundation
import Alamofire

struct UserSignService{
    // 싱글톤 객체 사용하여 앱 어디에서든 접근 할 수 있도록 추가
    // 어플리케이션이 시작될 때 어떤 클래스가 최초 한번만 메모리를 할당 (static) , 그 메모리에 인스턴스를 만들어 사용하는 디패
    // 지정한 클래스의 인스턴스가 1개 밖에 존재하지 않는 것을 보증
    static let shared = UserSignService()
    
    // 로그인 통신할 때 사용할 함수 , 우리는 email과. pw를 받음.
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        // escaping 클로저 : 클로저가 함수의 인자로 전달됐을 때, 함수의 실행의 종료된 후 실행되는 클로저
        let url = APIConstants.loginURL // 통신할 api 주소
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json" // 요청 헤더
        ]
        
        let body: Parameters = [
            "email": email,
            "password": password // 요청 바디
        ]
        
        // 자 이제 요청서 만들자 !
        // 알라모파이어의 request 함수 중 encoding 파라미터가 들어간 함수
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // 우리가 만든 요청서의 responseData 함수를 호출함으로써 데이터 통신 시작 !
        // 데이터 통신의 결과가 dataResponse에 담김
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
                // 성공과 실패에 따라 분기 처리
                // 성공할 경우, 통신결과의 스태터스코드와 밸류를 가져와 judge 함수를 이용해 정제된 값으로 받아 completion파라미터에 넣음 .
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
                // 실패한 경우 에러를 출력하고 networkresult로 fail을 전달
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
    }
}

    // 서버 통신 자체는 성공일지라도 응답 실패로 우리가원하는 데이터를 받지 못한 상태일 때를 분기처리하기 위한 함수.
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode{
        case 200: return isVaildLoginData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    // 정말 원하는 데이터가 들어왔을 때, 데이터 처리를 위한 함수
    // 서버에서 준 데이터를 codable을 채택하여 해독이 가능한 loginresponseData 구조체로 데이터를 변환
    // 그 데이터를 networkresult succeess 파라미터로 전달
    private func isVaildLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data)
          else {return .pathErr}
        return .success(decodedData)
    }
}
