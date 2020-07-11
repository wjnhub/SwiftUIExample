import UIKit

let a = 10

// 闭包/回调函数
let learniOS = {
    print("学习iOS")
}

learniOS()

// 带有参数的闭包 参数lan， in将参数与函数体隔开
let learn = { (lan: String) in
    print("学习\(lan)")
}

learn("Swift")

// 带参数和返回值的闭包 return为一行时可省了return
let learn1 = { (lan: String) -> String in
    return "学习\(lan)"
}

let result = learn1("SwiftUI")
print(result)

/* 作为另外一个函数的参数使用 */
// () -> Void 没有参数 没有返回值的闭包
func findWork(how: () -> Void ) {
    print("准备找工作")
    how()
    print("找到工作了")
}

findWork(how: learniOS)


// 尾随闭包
// 闭包作为另外一个函数的参数并且是`最后`一个参数
findWork {
    print("学习Swift")
}

// 两个参数
func findWork2(a: Int, how: (String) -> Void) {
    print("准备找工作2")
    how("iOS")
    print("找到工作了2")
}

findWork2(a: a, how: learn)

findWork2(a: a) { (lan) in
    print("学习\(lan)")
}

// $0,$1...
findWork2(a: a) {
    print("学习了\($0)")
}

// 闭包作为函数的返回值
// (String) -> Void 返回值
func findWork3() -> (String) -> Void {
    return { str in
        print("还在学习\(str)")
    }
}

let ret = findWork3()
ret("iOS")

// 闭包捕获
func findWork4() -> (String) -> Void {
    var counter = 1
    return {
        print("我还在学习\($0)+\(counter)")
        counter += 1
    }
}

let res = findWork4()
res("iOS")
res("iOS")
res("iOS")

