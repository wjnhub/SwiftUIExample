//
//  Plan.swift
//  ShenZhou
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
//

import Foundation


struct Plan: Identifiable, Codable {
    let id: Int
    let name: String
    let launchDate: String
    let members: [Members]?
    let description: String
    let hasBadge: Bool
    
    var imageName: String {
        hasBadge ? "shenzhou\(id)" : "placeholder"
    }
    
    struct Members: Codable {
        let name: String
        let birth: String
    }
}
