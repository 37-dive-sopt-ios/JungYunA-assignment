//
//  RecommendData.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/13/25.
//

struct Store {
    let store: String
    let menu: String
    let discountRate: Int
    let originalPrice: Int
    let salePrice: Int
    let reviewCount: Int
    let review: Double
    let storeImage : String
}

let dummyStores: [Store] = [
    .init(store: "미미사천 마라탕&마라샹궈", menu: "(대륙의 불맛) 셀프마라샹궈", discountRate: 25, originalPrice: 16000, salePrice: 12000, reviewCount : 1973, review: 5.0, storeImage: "image1"),
    .init(store: "육전국밥 서초역점", menu: "[최초] 육전소고기국밥", discountRate: 20, originalPrice: 16000, salePrice: 12000, reviewCount : 1973, review: 5.0, storeImage: "image2"),
    .init(store: "롯데리아 이수역점", menu: "핫크리스피치킨버거 세트", discountRate: 25, originalPrice: 16000, salePrice: 12000, reviewCount : 1973, review: 5.0, storeImage: "image3"),
    .init(store: "노모어피자 이수역점", menu: "옥수수 새우피자 R", discountRate: 25, originalPrice: 16000, salePrice: 12000, reviewCount : 1973, review: 5.0, storeImage: "image4"),
    .init(store: "프레퍼스 다이어트 푸드 강남직영점", menu: "비프 샐러드 파스타", discountRate: 25, originalPrice: 16000, salePrice: 12000, reviewCount : 1973, review: 5.0, storeImage: "image5"),
]
