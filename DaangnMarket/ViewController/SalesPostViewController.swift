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
    
    
    
    // "이 글과 함께 봤어요" 스택뷰 이미지
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
    func addRadius() {
        addRadiusToUIImageView(image1, size: 10)
        addRadiusToUIImageView(image2, size: 10)
        addRadiusToUIImageView(image3, size: 10)
        addRadiusToUIImageView(image4, size: 10)
        addRadiusToUIImageView(image5, size: 10)
        addRadiusToUIImageView(image6, size: 10)
    }
    
    
    
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
        // 채팅 관심 조회수 업데이트
        chattingInterestingChecking.text = "채팅 \(data.chattingCount) ∙ 관심 \(data.interestCount) ∙ 조회 \(data.viewCount+1)"
    }
    
    // 온도 이미지 업데이트 함수
    func setMannerImage(_ color: String) {
        mannerFace.image = UIImage(named: "\(color)얼굴.jpeg")
        temperature.image = UIImage(named: "\(color)온도.png")
        mannerEnergy.image = UIImage(named: "\(color)에너지.png")
    }
    
    
    
    
    
    
    // 글 정보 받아오기
    var receivedData: SalesPost?
    var mainVC: ViewController?
    
    
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼에 Radius
        addRadiusToUIButton(toChattingButton, size: 10)
        
        
        // 조회수 +1
        mainVC?.tableViewModel.addViewCount(receivedData!.title)
        
        
        // UI 업데이트
        updatePost(receivedData!)
        
        
        // 이미지에 radius 추가
        addRadius()
        
        
        
        
//        // 컬렉션 뷰 설정
//        collectioinView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectioinView.delegate = self
//        collectioinView.dataSource = self
//
//        // 스크롤 끄는거같은데... 안되는디..
//        collectioinView.isScrollEnabled = false
//
//        // 컬렉션뷰 레이아웃 설정
//        collectioinView.collectionViewLayout = createCompositionalLayout()
    }
    
}



// MARK: - CollectionView 컴포지셔널 레이아웃 관련 함수
//extension SalesPostViewController {
//    // 컴포지셔널 레이아웃 설정
//    fileprivate func createCompositionalLayout() -> UICollectionViewLayout {
//        // 컴포지셔널 레이아웃 생성
//        let layout = UICollectionViewCompositionalLayout{
//            // 생성되면 (Key: Value)의 묶음으로 들어옴 / 변환하는 값은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
//            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
//
//
//            // 각 아이템의 사이즈
//            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .absolute(250))
//
//            // 위에서 만든 아이템 사이즈로 아이템 만들기
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//            // 아이템 간의 간격 설정
//            item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
//
//            // 그룹 사이즈
//            let groubSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension)
//
//            // 그룹사이즈로 그룹 만들기
//            let groub = NSCollectionLayoutGroup.horizontal(layoutSize: groubSize, subitem: item, count: 2)
//
//            // 그룹으로 섹션 만들기
//            let section = NSCollectionLayoutSection(group: groub)
//
//            // 섹션에 대한 간격 설정
//            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
//
//            return section
//        }
//
//        return layout
//    }
//}







// MARK: - Protocol 채택
//extension SalesPostViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    // 몇개의 아이템을 보여줄건지
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 6
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "salesCollectionViewCell", for: indexPath) as? SalesPostCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//
//        cell.cellUpdate(salesModel.returnPostInfo(indexPath.item))
//
//
//
//        return cell
//    }
//
//
//}
