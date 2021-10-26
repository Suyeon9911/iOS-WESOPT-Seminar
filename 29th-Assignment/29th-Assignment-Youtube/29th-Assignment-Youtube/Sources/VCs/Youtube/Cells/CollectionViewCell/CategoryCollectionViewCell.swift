//
//  CategoryCollectionViewCell.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/25.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    var categoryButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

extension CategoryCollectionViewCell {
    func setUI() {
        categoryButton.setTitleColor(.white, for: .selected)
        categoryButton.setTitleColor(.black, for: .normal)
        
        
        if categoryButton.isSelected {
            categoryButton.backgroundColor = .darkGray
        } else {
            categoryButton.backgroundColor = .lightGray
        }
        
        categoryButton.layer.cornerRadius = 20
        categoryButton.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 20)
        
    }
    
    func setCategoryData(category: String?) {
        categoryButton.titleLabel?.text = category
    }
}
