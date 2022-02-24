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
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 265
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "UserInfoTableViewCell")
    }
}




extension MyDaangnViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let test = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as? UserInfoTableViewCell else {
            return UITableViewCell()
        }
        return test
    }
    
    
}
