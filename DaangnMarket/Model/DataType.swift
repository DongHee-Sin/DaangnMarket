//
//  DataType.swift
//  DaangnMarket
//
//  Created by 신동희 on 2022/02/20.
//

import Foundation


// MARK: - 사용자 타입
struct User {
    var nickName: String
    var address: String
    var mannerScore: Float
}



// MARK: - 게시글 타입
struct SalesPost {
    let writer: User
    var title: String
    var content: String
    var price: Int?
    var imageString: String?
    var category: ProductCategory
    var chattingCount: Int = 0
    var interestCount: Int = 0
    var viewCount: Int = 0
}



// MARK: - 상품 카테고리
enum ProductCategory: String {
    case 디지털기기 = "디지털기기"
    case 생활가전 = "생활가전"
    case 가구인테리어 = "가구/인테리어"
    case 유아동 = "유아동"
    case 생활가공식품 = "생활/가공식품"
    case 유아도서 = "유아도서"
    case 여성잡화 = "여성잡화"
    case 여성의류 = "여성의류"
    case 남성잡화 = "남성잡화"
    case 남성의류 = "남성의류"
    case 도서티켓음반 = "도서/티켓/음반"
    case 반려동물용품 = "반려동물용품"
    case 기타중고물품 = "기타 중고물품"
}


// MARK: - 동네생활글 카테고리
