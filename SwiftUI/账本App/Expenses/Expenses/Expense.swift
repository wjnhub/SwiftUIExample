//
//  Expense.swift
//  Expenses
//
//  Created by wjn on 2020/7/13.
//  Copyright © 2020 wjn. All rights reserved.
//

import Foundation

struct Expense: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var allExpenses: [Expense] {
        didSet { // 数据变化时调用
            if let data = try? JSONEncoder().encode(allExpenses) {
                UserDefaults.standard.set(data, forKey: "allExpenses")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "allExpenses"),
            let allExpenses = try? JSONDecoder().decode([Expense].self, from: data) {
            self.allExpenses = allExpenses
            return
        }
        
        allExpenses = [
            Expense(name: "小皮鞋", type: "服饰", amount: 250),
            Expense(name: "MacBook", type: "数码家电", amount: 12500),
            Expense(name: "牙膏", type: "生活用品", amount: 12)
        ]
    }
    
}
