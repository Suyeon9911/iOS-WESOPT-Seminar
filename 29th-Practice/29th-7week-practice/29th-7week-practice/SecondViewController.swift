//
//  SecondViewController.swift
//  29th-7week-practice
//
//  Created by 김수연 on 2021/12/08.
//

import UIKit

class SecondViewController: UIViewController {

    // 뷰 로드 시점으로 인해서  nil 에러가 뜸. 두번째 뷰컨의 뷰디드로드보다 첫번째 뷰컨에서 함수 호출이 먼저 일어남.
    // 프로퍼티 하나 선언한 후 viewdidload 호출에서 텍스트 필드의 text를 프로퍼티 값으로 넣도록! 
    var receivedText = ""

    private let titleLabel = UILabel().then {
        $0.text = "두번째 VC입니다"
    }

    private let secondTextField = UITextField().then {
        $0.borderStyle = .roundedRect
    }

    private lazy var checkButton = UIButton(type: .custom).then {
        $0.setTitle("보내기", for: .normal)
        $0.setTitleColor(.brown, for: .normal)

        $0.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        $0.isSelected = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        setTextField()
    }

}

extension SecondViewController {
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        /// 2번째 vc에서 첫번째 vc로
        /// 나를 present하고 있는 첫번째 vc 는 presentingvc , 내가 띄운 vc는 presentedvc
        let presentingVC = presentingViewController as? FirstViewController
        presentingVC?.firstTextField.text = secondTextField.text
        dismiss(animated: true, completion: nil)
    }
}

// 데이터 전달 1. present, push 시에 프로퍼티에 접근해 넘겨주는 방식
extension SecondViewController {
    func setDataInTextField(data: String) {
        secondTextField.text = data
    }
    func setTextField() {
        secondTextField.text = receivedText
    }
}

extension SecondViewController {
    private func setLayouts() {
        setViewHierarchies()
        setConstraints()
    }

    private func setViewHierarchies() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel, secondTextField, checkButton)
    }

    private func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(300)
            $0.centerX.equalToSuperview()
        }

        secondTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-30)
            $0.leading.equalToSuperview().offset(100)
            $0.trailing.equalToSuperview().offset(-100)
        }

        checkButton.snp.makeConstraints {
            $0.top.equalTo(secondTextField.snp.bottom).inset(-30)
            $0.width.equalTo(100)
            $0.height.equalTo(25)
            $0.centerX.equalToSuperview()
        }
    }
}

