//
//  VillageLifeTableViewCell.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/23.
//

import UIKit

class VillageLifeTableViewCell: UITableViewCell {

    // MARK: - UI연결
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var userNameAndAddress: UILabel!
    
    @IBOutlet weak var postImage: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func cellUpdate(_ data: VillageLifePost) {
        contentLabel.text = data.content
        userNameAndAddress.text = "\(data.writer.nickName) ∙ \(data.writer.address)"
        if data.imageString == nil {
            postImage.isHidden = true
        }else {
            postImage.image = UIImage(named: data.imageString!)
        }
    }
}
