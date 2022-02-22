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
    
    // MARK: - UI 연결
    // 채팅거는 버튼
    @IBOutlet weak var toChattingButton: UIButton!
    
    // 상품 이미지
    @IBOutlet weak var productImage: UIImageView!
    
    // 사용자 이름과 주소
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var address: UILabel!
    
    // 매너온도 관련
    @IBOutlet weak var mannerScore: UILabel!
    @IBOutlet weak var mannerFace: UIImageView!
    @IBOutlet weak var temperature: UIImageView!
    @IBOutlet weak var mannerEnergy: UIImageView!
    
    // 제목 / 카테고리 / 내용
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postCategory: UILabel!
    @IBOutlet weak var postContent: UILabel!
    
    // 채팅 / 관심 / 조회
    @IBOutlet weak var chattingInterestingChecking: UILabel!
    
    
    // MARK: - UI 업데이트 함수
    func updatePost(_ data: SalesPost) {
        if data.imageString == "기본이미지.jpeg" {
            productImage.isHidden = true
        }else {
            productImage.image = UIImage(named: data.imageString)
        }
        nickName.text = data.writer.nickName
        address.text = data.writer.address
        if data.writer.mannerScore >= 40 {
            mannerScore.text = String(data.writer.mannerScore)
            mannerScore.textColor = UIColor(red: 255/255, green: 173/255, blue: 57/255, alpha: 1)
            setMannerImage("노란")
        }else {
            mannerScore.text = String(data.writer.mannerScore)
            mannerScore.textColor = UIColor(red: 15/255, green: 96/255, blue: 163/255, alpha: 1)
            setMannerImage("파란")
        }
        postTitle.text = data.title
        postCategory.text = data.category.rawValue
        postContent.text = data.content
    }
    
    // 온도 이미지 업데이트 함수
    func setMannerImage(_ color: String) {
        mannerFace.image = UIImage(named: "\(color)얼굴.jpeg")
        temperature.image = UIImage(named: "\(color)온도.png")
        mannerEnergy.image = UIImage(named: "\(color)에너지.png")
    }
    
    
    // 글 정보 받아오기
    var receivedData: SalesPost?
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼에 Radius
        addRadiusToUIButton(toChattingButton, size: 10)
        
        
        // UI 업데이트
        updatePost(receivedData!)
    }
}
