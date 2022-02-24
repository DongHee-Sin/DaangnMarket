//
//  UserSettingTableViewCell.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/24.
//

import UIKit

class UserSettingTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var settingCellImage: UIImageView!
    
    @IBOutlet weak var settingCellLabel: UILabel!
    
    
    // 셀 업데이트
    func cellUpdate(_ data: Setting) {
        settingCellImage.image = UIImage(systemName: data.imageString)
        settingCellLabel.text = data.text
    }
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
