//
//  GestureVC.swift
//  29th-7week-seminar
//
//  Created by 김수연 on 2021/11/27.
//

import UIKit

class GestureVC: UIViewController {

    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //제스처 인식기 초기화 및 생성
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        // 2번째 방법 둘다 사용가능
        let tapRecognizer2 = UITapGestureRecognizer()
        tapRecognizer2.addTarget(self, action: #selector(tapView(gestureRecognizer:)))

        testView.addGestureRecognizer(tapRecognizer)
    }

    @objc func tapView(gestureRecognizer: UIGestureRecognizer){
        print("뷰안에서 tap")
    }
}
