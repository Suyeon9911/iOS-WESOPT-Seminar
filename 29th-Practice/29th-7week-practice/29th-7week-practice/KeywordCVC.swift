//
//  KeywordCVC.swift
//  29th-7week-practice
//
//  Created by 김수연 on 2021/12/10.
//

import UIKit

import Then
import SnapKit

class KeywordCVC: UICollectionViewCell {
    
    static let identifier = "keywordCVC"
    var keyword: String = ""
    var selectedKeyword: Bool = false

    private let nameButton = UIButton(type: .custom).then {
        $0.setTitleColor(.black, for: .normal)

        $0.addTarget(self, action: #selector(nameButtonDidTapped(_:)), for: .touchUpInside)
        $0.isSelected = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension KeywordCVC {
    @objc
    private func nameButtonDidTapped(_ sender: UIButton) {
        
    }

    func setKeyword(text: String){
        keyword = text
        nameButton.setTitle(keyword, for: .normal)
    }
}

extension KeywordCVC {
    private func setLayouts() {
        setViewHierarchies()
        setConstraints()

    }

    private func setViewHierarchies() {
        contentView.addSubview(nameButton)
    }

    private func setConstraints() {
        nameButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
