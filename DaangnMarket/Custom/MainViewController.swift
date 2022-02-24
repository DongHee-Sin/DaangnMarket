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
    
    // MARK: - UI Image
    func addRadiusToUIImageView(_ img: UIImageView, size: CGFloat) {
        img.layer.cornerRadius = size
    }
    
    
    
    
    // MARK: - UI View
    func addBorderToUIView(_ to: UIView, size: CGFloat, color: CGColor) {
        to.layer.borderWidth = size
        to.layer.borderColor = color
    }
    
    func addRadiusToUIView(_ view: UIView, size: CGFloat) {
        view.layer.cornerRadius = size
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
    
    
    
    
    
    // MARK: - @objc버튼 정의
    // dismiss
    @objc func didTouchedDismissButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    // MARK: - 플러팅 버튼
    func setFloatingButton() {
            let floatingButton = MDCFloatingButton()
            let image = UIImage(systemName: "plus.circle.fill")
            floatingButton.sizeToFit()
            floatingButton.translatesAutoresizingMaskIntoConstraints = false
            floatingButton.setImage(image, for: .normal)
            floatingButton.setImageTintColor(.white, for: .normal)
        floatingButton.backgroundColor = UIColor(red: 255/255, green: 173/255, blue: 57/255, alpha: 1)
            floatingButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
            view.addSubview(floatingButton)
            view.addConstraint(NSLayoutConstraint(item: floatingButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -100))
            view.addConstraint(NSLayoutConstraint(item: floatingButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20))
        }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
}
