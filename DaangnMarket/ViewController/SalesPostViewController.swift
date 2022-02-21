//
//  SalesPostViewController.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/21.
//

import Foundation
import UIKit


class SalesPostViewController: MainViewController {
    
    // 뒤로가기 버튼
    @IBAction func didTouchedPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // UI 연결
    @IBOutlet weak var toChattingButton: UIButton!
    
    
    
    
    
    
    var receivedData: SalesPost?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼에 Radius
        addRadiusToUIButton(toChattingButton, size: 10)
        
        
        // UI 업데이트
        
    }
}
