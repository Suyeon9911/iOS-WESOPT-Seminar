//
//  PartDataModel.swift
//  29th-3week-seminar
//
//  Created by 김수연 on 2021/10/23.
//

import UIKit

struct PartData{
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
