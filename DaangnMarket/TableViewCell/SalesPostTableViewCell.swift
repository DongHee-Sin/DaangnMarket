//
//  SalesPostTableViewCell.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/20.
//

import UIKit

class SalesPostTableViewCell: MainTableViewCell {
    
    // MARK: - UI연결
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellAddress: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    

    
    // ViewDidLoad와 같은 역할 (초기화 작업을 함)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func cellUpdate(_ data: SalesPost) {
        if let image = data.imageString {
            cellImage.image = UIImage(named: image)
        }
        cellTitle.text = data.title
        cellAddress.text = data.writer.address
        guard let price = data.price else {
            cellPrice.text = ""
            return
        }
        if price == 0 {
            cellPrice.text = "나눔🧡"
        }else {
            cellPrice.text = DecimalWon(value: price)
        }
    }
}
