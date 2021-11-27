//
//  keywordCVC.swift
//  29th-7week-seminar
//
//  Created by 김수연 on 2021/11/27.
//

import UIKit

protocol KeywordCellDelegate{
    func keywordCellSelected(cell: keywordCVC)
    func keywordCellUnselected(cell: keywordCVC, unselectedName: String)
}

class keywordCVC: UICollectionViewCell {
    static let identifier = "keywordCVC"

    @IBOutlet weak var keywordButton: UIButton!
    var keyword: String = ""
    var selectedKeyword: Bool = false
    var keywordDelegate: KeywordCellDelegate?
    var presentingClosure: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func touchUpToSelect(_ sender: Any) {
        if selectedKeyword {
            keywordDelegate?.keywordCellUnselected(cell: self, unselectedName: keyword)
            keywordButton.backgroundColor = .white
        }else {
            keywordDelegate?.keywordCellSelected(cell: self)
            keywordButton.backgroundColor = .yellow
            /// 클로저를 외부에서 넣어주지 않는 이상 이부분은 nil이기 때문에 실행되지 않습니다.
            presentingClosure?()
        }
        selectedKeyword.toggle()
    }

    func setKeyword(text: String){
        keyword = text
        keywordButton.setTitle(keyword, for: .normal)
    }

}
