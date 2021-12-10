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
        return cell 
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
