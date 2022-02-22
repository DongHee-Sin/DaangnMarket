//
//  CategoryViewController.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/22.
//

import Foundation
import UIKit

class CategoryViewController: MainViewController {
    
    // 열거형 값 다 가져오기 (protocol사용)
    let categoryList = ProductCategory.allCases
    
    
    // 테이블뷰 연결
    @IBOutlet weak var categoryTableView: UITableView!
    
    
    // 글 작성 View 가져오기 (눌린 버튼으로 값 입력해주기 위함)
    var writingVC: WritingSalesPostViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "categoryCell")
    }
}


extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.cellUpdate(categoryList[indexPath.row])
        
        return cell
    }
    
    
}
