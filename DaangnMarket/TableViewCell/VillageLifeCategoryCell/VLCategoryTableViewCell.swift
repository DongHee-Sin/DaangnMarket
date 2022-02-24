//
//  VLCategoryTableViewCell.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/23.
//

import UIKit

class VLCategoryTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var categoryStackView: UIStackView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        for eachView in categoryStackView.subviews {
            eachView.layer.borderWidth = 1
            eachView.layer.borderColor = UIColor.lightGray.cgColor
            eachView.layer.cornerRadius = 5
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
