//
//  MyImageDataModel.swift
//  PickerViewPractice
//
//  Created by 김수연 on 2021/10/24.
//

import UIKit

struct MyImageData{
    var imageFileName: String
    var imageTitleName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageFileName)
    }
    
}
