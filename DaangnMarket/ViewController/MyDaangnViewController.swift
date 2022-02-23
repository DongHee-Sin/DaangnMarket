//
//  MyDaangnViewController.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/21.
//

import UIKit

class MyDaangnViewController: MainViewController {
    
    // 사용중인 유저 이름
    @IBOutlet weak var userNickName: UILabel!
    var userStringName: String = "에이든"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 저장된 유저 이름으로 Label 업데이트
        userNickName.text = self.userStringName
    }
}
