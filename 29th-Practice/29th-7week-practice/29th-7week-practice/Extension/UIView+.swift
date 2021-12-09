//
//  UIView+.swift
//  29th-7week-practice
//
//  Created by 김수연 on 2021/12/09.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
