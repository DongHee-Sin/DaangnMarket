//
//  VillageLifeViewController.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/23.
//

import Foundation
import UIKit

class VillageLifeViewController: MainViewController {
    
    var tableViewModel = VillageLiftPostModel()
    
    // MARK: - TableView 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let categoryNib = UINib(nibName: "VLCategoryTableViewCell", bundle: nil)
        let cellNib = UINib(nibName: "VillageLifeTableViewCell", bundle: nil)
        
        tableView.register(categoryNib, forCellReuseIdentifier: "VLCategoryTableViewCell")
        tableView.register(cellNib, forCellReuseIdentifier: "VillageLifeTableViewCell")
        
        // 동적 높이 조절
        tableView.estimatedRowHeight = tableView.frame.width / 10
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}



extension VillageLifeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VLCategoryTableViewCell", for: indexPath) as? VLCategoryTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }else {
            guard let postCell = tableView.dequeueReusableCell(withIdentifier: "VillageLifeTableViewCell", for: indexPath) as? VillageLifeTableViewCell else {
                return UITableViewCell()
            }
            postCell.cellUpdate(tableViewModel.returnPostInfo(indexPath.row))
            postCell.selectionStyle = .none
            return postCell
        }
    }
    
    
}
