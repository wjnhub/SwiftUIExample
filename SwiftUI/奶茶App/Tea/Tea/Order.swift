//
//  Order.swift
//  Tea
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
//

import Foundation

class Order: Codable, ObservableObject {
    
    // 1. 规定哪些属性需要被编码和解码
    enum CodingKeys: CodingKey {
        case num, isAddIce, isAddSugar, name, phone, address
    }
    
    // 2. 自定义解码功能
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        num = try container.decode(Int.self, forKey: .num)
        isAddIce = try container.decode(Bool.self, forKey: .isAddIce)
        isAddSugar = try container.decode(Bool.self, forKey: .isAddSugar)
        name = try container.decode(String.self, forKey: .name)
        phone = try container.decode(String.self, forKey: .phone)
        address = try container.decode(String.self, forKey: .address)
    }
    
    // 3. 自定义编码
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(num, forKey: .num)
        try container.encode(isAddIce, forKey: .isAddIce)
        try container.encode(isAddSugar, forKey: .isAddSugar)
        try container.encode(name, forKey: .name)
        try container.encode(phone, forKey: .phone)
        try container.encode(address, forKey: .address)
    }
    
    init() {}
    
    @Published var num = 1
    @Published var isAddIce = false
    @Published var isAddSugar = false
    
    @Published var name = ""
    @Published var phone = ""
    @Published var address = ""
    
    // 当特殊需求关闭时，重置之前设置
    @Published var specialRequest = false {
        didSet {
            if !specialRequest {
                isAddSugar = false
                isAddIce = false
            }
        }
    }
    
    var hasInvalidAddress: Bool {
        name.isEmpty || phone.isEmpty || address.isEmpty
    }
}
