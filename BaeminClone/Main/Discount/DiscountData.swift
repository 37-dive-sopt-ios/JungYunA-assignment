//
//  DiscountData.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/14/25.
//


struct DiscountStore {
    let store: String
    let review: Double
    let reviewCount: Int
    let time: Int
    let recentOrder: Int
    let baeminClub : String
    let storeImage : String
}


let discountStore: [DiscountStore] = [
    .init(
        store: "미미사천 마라탕&마라샹궈 봉천점",
        review: 5.0,
        reviewCount: 1566,
        time: 31,
        recentOrder: 1,
        baeminClub: "무료배달",
        storeImage: "image1"
    ),
    
        .init(
            store: "육전국밥 서초역점",
            review: 4.7,
            reviewCount: 97,
            time: 27,
            recentOrder: 1,
            baeminClub: "무료배달",
            storeImage: "image2"
        ),
    
        .init(
            store: "롯데리아 이수역점",
            review: 4.9,
            reviewCount: 399,
            time: 24,
            recentOrder: 3,
            baeminClub: "무료배달",
            storeImage: "image3"
        ),
    
        .init(
            store: "노모어피자 이수역점",
            review: 4.9,
            reviewCount: 1374,
            time: 40,
            recentOrder: 2,
            baeminClub: "무료배달",
            storeImage: "image4"
        )
]


