//
//  WritingSalesPostViewController.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/22.
//

import Foundation
import UIKit

class WritingSalesPostViewController: MainViewController {
    
    // MARK: - Header UI연결
    @IBOutlet weak var headerLabel: UILabel!
    var headerText: String?
    
    
    
    
    // MARK: - 메인화면 ViewController 가져오기 (Model 업데이트 위함)
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
        
        // 글 작성하는 유저 정보 가져오기
        guard let userInfoVC = storyboard?.instantiateViewController(withIdentifier: "myDaangnView") as? MyDaangnViewController else {
            return
        }
        let userNickName: String = userInfoVC.userStringName
        
        
        
        // header의 text로 현 상태가 글 작성인지 글 수정인지 비교해서 처리
        if self.headerText! == HeaderText.거래추가.rawValue {
            // 글 작성
            homeVC?.tableViewModel.addPost(writer: userNickName, title: titleTextField.text!, content: contentTextView.text!, category: category!, price: Int(priceTextField.text ?? "") ?? nil)
        }else {
            /// 1. 글을 수정하는 경우 작동할 코드임
            /// 2. 글 수정하는 버튼으로 View전환이 된 경우, 수정하는 글을 Modal에서 찾을 수 있도록 identifier: String 변수를 하나 만들어서 초기 제목을 넣어줘야됨
            /// 3. Modal의 modifyPost()함수에서는 해당 identifier을 사용하여 firstIndex()로 수정되는 글의 index를 찾고
            /// 4. 찾은 index의 값에 접근하여 글을 수정하는 방식으로 접근하자
        }

        
        
        // ---홈화면 테이블뷰 업데이트---
        homeVC?.tableView.reloadData()
        
        // ---뷰 전환---
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
        
        // HeaderText 설정
        headerLabel.text = headerText!
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
