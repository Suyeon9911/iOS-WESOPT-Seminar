//
//  RankingTableViewCell.swift
//  29th-3week-seminar
//
//  Created by 김수연 on 2021/10/23.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    static let identifier = "RankingTableViewCell"

    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var openButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(rank: Int, appData: AppContentData) {
        rankLabel.text = "\(rank)"
        appIconImageView.image = appData.makeImage()
        titleLabel.text = appData.appName
        subTitleLabel.text = appData.description
    }
    
}
