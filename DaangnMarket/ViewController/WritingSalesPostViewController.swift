//
//  WritingSalesPostViewController.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/22.
//

import Foundation
import UIKit

class WritingSalesPostViewController: MainViewController {
    
    // MARK: - UI 연결
    // 뒤로가기 버튼
    @IBOutlet weak var dismissButton: UIButton!
    
    // 제목
    @IBOutlet weak var titleTextField: UITextField!
    
    // 카테고리
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryButton: UIButton!
    
    // 가격
    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var priceSuggestionButton: UIButton!
    @IBOutlet weak var priceTextField: UITextField!
    
    // 내용
    @IBOutlet weak var contentTextView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dismiss add target
        dismissButton.addTarget(self, action: #selector(didTouchedDismissButton), for: .touchUpInside)
        
        
        // textView 설정
        contentTextView.textColor = UIColor.lightGray
        contentTextView.text = "청덕동에 올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.)"
        contentTextView.delegate = self
        
        // textField 설정
        priceTextField.textColor = UIColor.lightGray
        priceTextField.text = "가격 (선택사항)"
        priceTextField.delegate = self
    }
}

// TextView
extension WritingSalesPostViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "청덕동에 올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.)"
            textView.textColor = UIColor.lightGray
        }
    }
}


extension WritingSalesPostViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.textColor == UIColor.lightGray {
            textField.text = nil
            textField.textColor = UIColor.black
            wonLabel.textColor = UIColor.black
            priceSuggestionButton.tintColor = UIColor.black
            priceSuggestionButton.setTitleColor(.black, for: .normal)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, text.isEmpty {
            textField.text = "가격 (선택사항)"
            textField.textColor = UIColor.lightGray
            wonLabel.textColor = UIColor.lightGray
            priceSuggestionButton.tintColor = UIColor.lightGray
            priceSuggestionButton.setTitleColor(.lightGray, for: .normal)
        }else {
            print("안비었음")
        }
        
    }
}
