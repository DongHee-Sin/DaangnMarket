//
//  MyDaangnViewController.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/21.
//

import UIKit

class MyDaangnViewController: MainViewController {
    
    // 사용중인 유저 이름
    var userStringName: String = "에이든"
    
    
    // 테이블뷰 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    // Model연결
    var settingModel = SettingModel()
    
    
    // 테이블뷰 각 섹션에 cell을 얼마나 넣을건지 알려주는 배열
    let eachSectionCell = [1, 4, 4, 2, 3, 5]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "UserInfoTableViewCell")
        tableView.register(UINib(nibName: "UserSettingTableViewCell", bundle: nil), forCellReuseIdentifier: "UserSettingTableViewCell")
    }
}




extension MyDaangnViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 섹션의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return eachSectionCell.count
    }
    
    
    // 섹션 헤더 높이?
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    
    // 각 섹션별로 셀이 몇개 들어가는지?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eachSectionCell[section]
    }
    
    
    // 셀을 어떤걸로 할건지ㅣ?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let infoCell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as? UserInfoTableViewCell else {
                return UITableViewCell()
            }
            return infoCell
        }else {
            guard let settingCell = tableView.dequeueReusableCell(withIdentifier: "UserSettingTableViewCell", for: indexPath) as? UserSettingTableViewCell else {
                return UITableViewCell()
            }
            settingCell.cellUpdate(settingModel.returnSettingInfoArr(indexPath.section)[indexPath.row])

            settingCell.selectionStyle = .none
            
            return settingCell
        }
    }
    
    
}
