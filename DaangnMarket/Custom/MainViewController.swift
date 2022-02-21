//
//  MainViewController.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/20.
//

import Foundation
import UIKit


// MARK: - UIViewController 커스텀
class MainViewController: UIViewController {
    
    // MARK: - UI View
    func addBorderToUIView(_ to: UIView, size: CGFloat, color: CGColor) {
        to.layer.borderWidth = size
        to.layer.borderColor = color
    }
    
    
    // MARK: - 숫자 -> 콤마찍어서 문자열 반환
    func DecimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
            return result
    }
    
    
    // MARK: - UIButton 함수
    // 버튼에 Radius 추가
    func addRadiusToUIButton(_ button: UIButton, size: CGFloat) {
        button.layer.cornerRadius = size
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
}