//
//  SalesPostTableViewCell.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/20.
//

import UIKit

class SalesPostTableViewCell: UITableViewCell {
    
    // MARK: - UI연결
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellTitle: UILabel!
    
    
    

    
    // ViewDidLoad와 같은 역할 (초기화 작업을 함)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
