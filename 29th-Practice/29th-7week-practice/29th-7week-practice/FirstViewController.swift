//
//  FirstViewController.swift
//  29th-7week-practice
//
//  Created by 김수연 on 2021/12/08.
//

import UIKit

import Then
import SnapKit

class FirstViewController: UIViewController {

    private let titleLabel = UILabel().then {
        $0.text = "첫번째 VC입니다"
    }

    let firstTextField = UITextField().then {
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
    }

}

extension FirstViewController {
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        let nextVC = SecondViewController()
        // 옵셔널 바인딩 후 text 넣어서 present

//        nextVC.receivedText = firstTextField.text ?? ""
//        present(nextVC, animated: true) {
//            nextVC.setDataInTextField(data: "클로저 사용 : present 이후에 text가 변경됨")
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived), name: NSNotification.Name("sample"), object: nil)

        present(nextVC, animated: true, completion: nil)
    }
    
    @objc
    private func dataReceived(notification: NSNotification){
        if let text = notification.object as? String {
            // notification에서 전달한 object 값이 있다면, 타입캐스팅
            firstTextField.text = text
        }
    }
}

extension FirstViewController {
    private func setLayouts() {
        setViewHierarchies()
        setConstraints()
    }

    private func setViewHierarchies() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel, firstTextField, checkButton)
    }

    private func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(300)
            $0.centerX.equalToSuperview()
        }

        firstTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-30)
            $0.leading.equalToSuperview().offset(100)
            $0.trailing.equalToSuperview().offset(-100)
        }

        checkButton.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).inset(-30)
            $0.width.equalTo(100)
            $0.height.equalTo(25)
            $0.centerX.equalToSuperview()
        }
    }
}
