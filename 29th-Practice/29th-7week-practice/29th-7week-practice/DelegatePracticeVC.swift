//
//  DelegatePracticeVC.swift
//  29th-7week-practice
//
//  Created by 김수연 on 2021/12/09.
//

import UIKit

import Then
import SnapKit

class DelegatePracticeVC: UIViewController {

    var nameList: [String] = []
    var selectedNameList: [String] = []

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(KeywordCVC.self, forCellWithReuseIdentifier: KeywordCVC.identifier)
        return collectionView
    }()

    private let checkLabel = UILabel().then {
        $0.text = "몇 명이 선택되었습니다."
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        setDelegation()
        updateData()
    }
}

extension DelegatePracticeVC {
    private func setDelegation() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func updateData() {
//        let nameList = NameListModel()
//        self.nameList = nameList.getNameListModel()

        nameList.append(contentsOf: ["김루희","김선영","김소연","김수연","김승찬","김윤서","김인환",
                                     "김지수","김태현","김현규","김혜수","박예빈","박익범","배은서",
                                     "송지훈","신윤아","안현주","양수빈","이경민","이남준","이유진",
                                     "이준호","임주민","장혜령","정은희","정정빈","조양원","최은주",
                                     "최이준","홍승현","황지은"])
    }
}

extension DelegatePracticeVC: UICollectionViewDelegate {

}

extension DelegatePracticeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCVC.identifier, for: indexPath) as? KeywordCVC else { return UICollectionViewCell()}

        cell.setKeyword(text: nameList[indexPath.row])

        // cell들의 데이터를 지정하는 부분에서 클로저 구현코드 추가
        if nameList[indexPath.row] == "김수연"{
            cell.presentingClosure = {
                let nextVC = FirstViewController()
                self.present(nextVC, animated: true, completion: nil)
            }
        }
        cell.keywordDelegate = self
        return cell 
    }


}

extension DelegatePracticeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension DelegatePracticeVC: KeywordCellDelegate {
    // 키워드 셀 딜리게이트 채택하여 구현

    func keywordCellSelected(cell: KeywordCVC) {
        // 버튼이 눌렸을때 vc에 있는 selectedNameList에 추가.
        // 키워드 vc에서 버튼이 눌렸을 때 해당 함수를 호출 -> 해당 함수가 불렸을때 vc에 있는 데이터 처리 가능..
        // cell 자체에서는 컬렉션 뷰가 있는 vc에 기본적으로 관여하지 않고,, 실제 들어갈 알맹이를 구현해서 다른곳에 위임하여 사용.
        // 뷰 계층간 데이터 전달에서 용이하게 사용 !
        selectedNameList.append(cell.keyword)
        updateCheckLabel()
    }

    func keywordCellUnselected(cell: KeywordCVC, unselectedName: String) {
        //  버튼이 다시 눌려 언셀렉이 되었을 때 네임 리스트에서 눌린 이름 을 가지고 인덱스를 찾아 remove
        let deletingIndex = selectedNameList.firstIndex(of: unselectedName) ?? -1
        selectedNameList.remove(at: deletingIndex)
        updateCheckLabel()
    }

    func updateCheckLabel(){
        checkLabel.text = "\(selectedNameList.count)명이 선택되었습니다"
        checkLabel.textColor = selectedNameList.count > 8 ? .red : .black
    }

}

extension DelegatePracticeVC {
    private func setLayouts() {
        setViewHierarchies()
        setConstraints()
    }

    private func setViewHierarchies() {
        view.backgroundColor = .white
        view.addSubviews(collectionView, checkLabel)
    }

    private func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(500)
        }

        checkLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).inset(-100)
            $0.centerX.equalTo(collectionView.snp.centerX)
        }
    }
}
