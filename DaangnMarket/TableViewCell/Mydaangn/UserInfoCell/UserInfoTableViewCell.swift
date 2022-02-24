//
//  UserInfoTableViewCell.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/24.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var loginUserName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
