//
//  ViewController.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/20.
//

import UIKit

class ViewController: MainViewController {

    // 테이블뷰 모델
    var tableViewModel = SalesPostModel()
    
    // 테이블뷰
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        // Delegate 지정
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SalesPostTableViewCell", bundle: nil), forCellReuseIdentifier: "salesCell")
    }


}


// MARK: - Protocol 채택
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "salesCell", for: indexPath) as? SalesPostTableViewCell else {
            return UITableViewCell()
        }
        
        let postData = tableViewModel.returnPostInfo(indexPath.row)
        
        
        cell.cellUpdate(postData)
        
        
        return cell
    }
    
    
}
