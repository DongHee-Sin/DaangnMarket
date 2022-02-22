//
//  WritingSalesPostViewController.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/22.
//

import Foundation
import UIKit

class WritingSalesPostViewController: MainViewController {
    
    // ViewController 가져오기 (Model 업데이트 위함)
    var homeVC: ViewController?
    
    
    
    // MARK: - UI 연결
    // 뒤로가기 버튼
    @IBOutlet weak var dismissButton: UIButton!
    
    // 제목
    @IBOutlet weak var titleTextField: UITextField!
    
    // 카테고리
    var category: ProductCategory?
    @IBOutlet weak var categoryLabel: UILabel!
    @IBAction func didTouchedCategoryButton(_ sender: UIButton) {
        guard let categoryVC = storyboard?.instantiateViewController(withIdentifier: "categoryView") as? CategoryViewController else {
            return
        }
            
        categoryVC.writingVC = self
        
        self.navigationController?.pushViewController(categoryVC, animated: true)
//        self.present(categoryVC, animated: true, completion: nil)
    }
    
    
    // 가격
    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var priceSuggestionButton: UIButton!
    @IBOutlet weak var priceTextField: UITextField!
    
    // 내용
    @IBOutlet weak var contentTextView: UITextView!
    
    
    
    
    // MARK: - 완료 버튼 (글 작성 / Model에 data 추가하기)
    @IBAction func didTouchedWriteButton(_ sender: UIButton) {
        
        guard let userInfoVC = storyboard?.instantiateViewController(withIdentifier: "myDaangnView") as? MyDaangnViewController else {
            return
        }
        print("뷰컨은 가져옴")
        // 글 작성하는 유저 정보 가져오기
        let userNickName: String = userInfoVC.userStringName
        
        // model에 데이터 추가
        // 일단 ViewController를 self로 가져와야됨 -> 왜? -> 홈화면VC에 있는 Model을 직접 업데이트 시켜야되서 그럼..
        homeVC?.tableViewModel.addPost(writer: userNickName, title: titleTextField.text!, content: contentTextView.text!, category: category!, price: Int(priceTextField.text ?? "") ?? nil)
        
        
        // 홈화면 테이블뷰 업데이트
        homeVC?.tableView.reloadData()
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
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
