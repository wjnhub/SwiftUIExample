//
//  Bundle-Decodable.swift
//  ShenZhou
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: nil),
            let data = try? Data(contentsOf: url),
            let loaded = try? JSONDecoder().decode(T.self, from: data)
            else { fatalError("没取到数据")}
        return loaded
    }
}
