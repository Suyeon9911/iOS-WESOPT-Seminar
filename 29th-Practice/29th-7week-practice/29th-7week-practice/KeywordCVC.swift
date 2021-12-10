//
//  KeywordCVC.swift
//  29th-7week-practice
//
//  Created by 김수연 on 2021/12/10.
//

import UIKit

import Then
import SnapKit

protocol KeywordCellDelegate{
    // keywordcell이 선택되었을 때, 선택되지 않았을때 일을 처리할 수 있는 대리자 모집공고
    func keywordCellSelected(cell: KeywordCVC)
    func keywordCellUnselected(cell: KeywordCVC, unselectedName: String)
}

class KeywordCVC: UICollectionViewCell {
    
    static let identifier = "keywordCVC"
    var keyword: String = ""
    var selectedKeyword: Bool = false

    // 대리자 모집공고를 보고 대리자가 들어올 자리를 하나 만들어두기
    var keywordDelegate: KeywordCellDelegate?
    // optional 타입으로 클로저를 프로퍼티로 선언 !
    var presentingClosure: (() -> ())?

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
        // 어떤 일이 들어왔을때 대리자가 할수 있는 일을 시킨다 !
        if selectedKeyword {
            keywordDelegate?.keywordCellUnselected(cell: self , unselectedName: keyword)

            nameButton.backgroundColor = .clear
        } else {
            keywordDelegate?.keywordCellSelected(cell: self)
            nameButton.backgroundColor = .yellow
            // 버튼이 눌렸을 때 클로저가 실행 , 옵셔널 클로저 호출
            presentingClosure?()
        }
        selectedKeyword.toggle()
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
