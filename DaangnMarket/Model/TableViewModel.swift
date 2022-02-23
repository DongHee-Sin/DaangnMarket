//
//  TableViewModel.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/21.
//

import Foundation
import UIKit


// MARK: - User
class UserModel {
    private var storage: [String: User] = [:]
    
    init() {
        storage = [
            "에이든": User(nickName: "에이든", address: "청덕동", mannerScore: 43.7),
            "당근마": User(nickName: "당근마", address: "마북동", mannerScore: 39.1),
            "비움": User(nickName: "비움", address: "동백동", mannerScore: 36.7),
            "노구트": User(nickName: "노구트", address: "마북동", mannerScore: 41.2),
            "인기제품": User(nickName: "인기제품", address: "중동", mannerScore: 42.0)
        ]
    }
    
    var count: Int {
        return storage.count
    }
    
    
    func returnUserInfo(_ nickName: String) -> User {
        return storage[nickName] ?? User(nickName: "", address: "", mannerScore: 0)
    }
}






// MARK: - SalesPostModel
class SalesPostModel {
    private var storage: [SalesPost] = []
    
    
    // 유저정보 넣으려고 가져온 변수
    private let userModel: UserModel = UserModel()
    
    init() {
        storage = [
            SalesPost(writer: userModel.returnUserInfo("당근마"), title: "청소기 무료나눔", content: "무나해요 비대면 문고리!", price: 0, imageString: "청소기.jpg", category: .기타중고물품, identifier: 0),
            SalesPost(writer: userModel.returnUserInfo("에이든"), title: "아이패드 10.5", content: "상태좋아요\n직접보고 구매하세요\n당근페이 거래하면 5처넌 네고 가능해요", price: 300000, imageString: "아이패드.jpg", category: .디지털기기, identifier: 1),
            SalesPost(writer: userModel.returnUserInfo("비움"), title: "바람막이", content: "노스페이스 바람막이\n제작년에 정가 10만원에 구매했어요. 싸게 가져가세요", price: 10000, imageString: "바람막이.jpg", category: .남성의류, identifier: 2),
            SalesPost(writer: userModel.returnUserInfo("노구트"), title: "키보드", content: "청축 기계식 키보드 키감이 매우 훌륭합니다 차각차각한거 좋아하시면 추천 디자인도 감성있어요", price: 50000, imageString: "키보드.jpg", category: .디지털기기, identifier: 3),
            SalesPost(writer: userModel.returnUserInfo("인기제품"), title: "게이밍 의자", content: "사용감있어요. 비대면거래 선호\n거래 후 반품환불 불가능합니다.", price: 30000, imageString: "게이밍의자.jpg", category: .가구인테리어, identifier: 4),
            SalesPost(writer: userModel.returnUserInfo("비움"), title: "캔들워머 미개봉", content: "선물받은거 미개봉입니다.", price: 15000, category: .여성잡화, identifier: 5)
        ]
    }
    
    
    var count: Int {
        return storage.count
    }
    
    
    func returnPostInfo(_ index: Int) -> SalesPost {
        return storage[index]
    }
    
    
    // 조회수 +1
    func addViewCount(_ identifier: Int) {
        
        let targetIndex = storage.firstIndex(where: {
            $0.identifier == identifier
        })
        storage[targetIndex!].viewCount += 1
    }
    
    // 글 작성
    func addPost(writer: String, title: String, content: String, category: ProductCategory, price: Int? = nil) {

        storage.append(SalesPost(writer: userModel.returnUserInfo(writer), title: title, content: content, price: price, category: category, identifier: storage[storage.count-1].identifier+1))
        
    }
    
    // 글 수정
    func modifyPost(identifier: Int, title: String, content: String, category: ProductCategory, price: Int? = nil) {
        let targetIndex = storage.firstIndex(where: {
            $0.identifier == identifier
        })
        storage[targetIndex!].title = title
        storage[targetIndex!].content = content
        storage[targetIndex!].category = category
        storage[targetIndex!].price = price
    }
    
//    // 글 삭제
    func deletePost(_ identifier: Int) {
        
        let targetIndex = storage.firstIndex(where: {
            $0.identifier == identifier
        })
        storage.remove(at: targetIndex!)
    }
}
