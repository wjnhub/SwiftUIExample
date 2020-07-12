//
//  CustomModifiers.swift
//  ViewsAndModifiers
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct CustomModifiers: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, World!")
                .modifier(Title())
            
            Text("Hello, World!")
                .titleStyle()
            
            Color.blue
                .frame(width: 300, height: 200)
                .waterMark("wjn")
        }
        
    }
}

// 自定义修饰符，一般单独文件里写

// 类似此类修饰符.clipShape(Capsule())
struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
// 自定义修饰符--添加水印
struct WaterMark: ViewModifier {
    let text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

// 类似此类修饰符 .font(.largeTitle)
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func waterMark(_ text: String) -> some View {
        self.modifier(WaterMark(text: text))
    }
}

struct CustomModifiers_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifiers()
    }
}
