import UIKit
import SwiftUI

// Generic泛型 -- 占位符（T）
max(1, 2)

max(1.3, 2.1)

max("aa", "aaa")

// T泛指某种类型
// where T : Comparable表示： T必须可比较
func max<T>(_ x: T, _ y: T) -> T where T : Comparable {
    return y >= x ? y : x
}


//public protocol View {
//
//    /// The type of view representing the body of this view.
//    ///
//    /// When you create a custom view, Swift infers this type from your
//    /// implementation of the required `body` property.
//    associatedtype Body : View
//
//    /// Declares the content and behavior of this view.
//    var body: Self.Body { get }
//}

// Protocol 'View' can only be used as a generic constraint because it has Self or associated type requirements
//func createView() -> View {
//
//}


//func createView<T: View>() -> T {
//
//}

// error: Type 'HomePage' does not conform to protocol 'View'
//struct HomePage: View {
//    var body: View {
//        Text("首页")
//    }
//}

//struct HomePage: View {
//    var body: Text {
//        Text("首页")
//    }
//}

// Opaque return type 不透明返回类型
// 反向泛型
struct HomePage: View {
    var body: some View {
        Text("首页")
    }
}
