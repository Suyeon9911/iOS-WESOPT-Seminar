//
//  AppContentDataModel.swift
//  29th-3week-seminar
//
//  Created by 김수연 on 2021/10/23.
//

import UIKit

struct AppContentData{
    let appName: String
    let description: String
    let appIconName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: appIconName)
    }
}
