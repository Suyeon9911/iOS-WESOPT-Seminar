//
//  NameListModel.swift
//  29th-7week-practice
//
//  Created by 김수연 on 2021/12/10.
//

import Foundation

struct NameListModel {
    private var data: [String]?

    init() {
        self.data?.append(contentsOf: ["김루희","김선영","김소연","김수연","김승찬","김윤서","김인환",
                                       "김지수","김태현","김현규","김혜수","박예빈","박익범","배은서",
                                       "송지훈","신윤아","안현주","양수빈","이경민","이남준","이유진",
                                       "이준호","임주민","장혜령","정은희","정정빈","조양원","최은주",
                                       "최이준","홍승현","황지은"])
    }

    public func getNameListModel() -> [String] {
        return data ?? []
    }
}
