import UIKit

// 系统实现 3的2次方
let xx = pow(3, 2)

// 扩展Int类型方法
extension Int {
    // 实现平方
    func squared() -> Int {
        return self * self
    }
    
    // 判断是否为偶数
    var isEven: Bool {
        return self % 2 == 0
    }

}

let xxx = 3.squared()
let bbb = 8.isEven

// 协议扩展
let arr = ["语文", "数学", "英语", "语文", "数学", "英语"]
let s = Set(["小明", "小王", "小李"])

// 数组和Set都遵循Collection协议，可直接扩展Collection
extension Collection {
    func summarize() {
        print("一共有\(count)个")
        for name in self {
            print(name)
        }
    }
}

arr.summarize()
s.summarize()
