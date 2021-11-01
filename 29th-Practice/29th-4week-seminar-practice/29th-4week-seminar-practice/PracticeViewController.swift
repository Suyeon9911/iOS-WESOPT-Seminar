//
//  CoffeeDataModel.swift
//  29th-4week-seminar-practice
//
//  Created by 김수연 on 2021/11/02.
//

import Foundation
import UIKit

struct CoffeeDataModel : Decodable {
    // decodable을 채택한다면, 이제 이 데이터 모델은 다른 데이터에서부터 요 데이터 모델로 디코딩이 가능하단뜻 !
    var drink : String
    var price : Int
    var orderer : String
    
    enum CodingKeys : String, CodingKey{
        case drink
        case price = "coffee_price"
        case orderer
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        drink = (try? values.decode(String.self, forKey: .drink)) ?? ""
        price = (try? values.decode(Int.self, forKey: .price)) ?? 0
        orderer = (try? values.decode(String.self, forKey: .orderer)) ?? ""
    }
}

class PracticeViewController: UIViewController {
    
    // 연습용 데이터 -> 문자열 여러줄 동시에 작성 !
    let dummyData = """
    {
      "drink" : "아메리카노",
      "coffee_price" : 2000,
      "orderer" : "jh"
    }
    """.data(using: .utf8)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 디코더 선언
        let jsonDecoder = JSONDecoder()
        // do-catch 문을 사용해서 위에 선언한 디코더에서 디코드를 try하는 모습 ,
        // 데이터형을 넣고 어떤 데이터를 디코드 할지 작성
        // try 시, 에러가 발생하면 catch로 , 성공한다면 order에 저장
        
        do
        {
            let order = try jsonDecoder.decode(CoffeeDataModel.self, from: dummyData)
            print("디코더 성공")
            dump(order)
        }
        catch
        {
            print(error)
        }
    }
    
    // 서버 쪽에서 데이터를 넘겨줄때 특정 이슈가 발생해서 key 이름이 변경되거나 데이터 셋 자체가 넘어오지 않는 경우!
    // 1. key 이름 변경 -> 구조체에서 정의된 프로퍼티 이름을 전부 수정해야되는 문제.. -> CodingKeys 라는 것을 사용.
    // CodingKeys를 사용하면 기존 프로퍼티 이름은 그대로 놔두고, json에서 넘어오는 이름에 대응할 수 있게됨
    // json의 키 값과 프로퍼티의 이름이 동일하다면 case이름만 선언 ! 꼮 코딩키라는 이름으로 열거형 선언
    // 2. 키 밸류 쌍이 없을 때
    // 키 밸류 쌍이 한 쌍 없어서 나머지도 디코드가 불가능한 상황 ?
    // 직접 디코드를 해야된다
    // 정상 디코드 ㄴㄴ
    
    
}
