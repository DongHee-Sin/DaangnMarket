//
//  CategoryTableViewCell.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    
    // UI 연결
    @IBOutlet weak var categoryName: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func cellUpdate(_ category: ProductCategory) {
        categoryName.text = category.rawValue
    }
}
