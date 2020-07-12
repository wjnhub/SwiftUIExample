//
//  ViewAsProperties.swift
//  ViewsAndModifiers
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct ViewAsProperties: View {
    
    let x = Text("Hello World")
    let y = Text("Hello World")
    
    @State private var zz = ""
    // 不可引用同级属性 可用计算属性实现
//    let z = TextField("zz", text: $zz)
    var z: some View {
        TextField("zz", text: $zz)
    }
    
    var body: some View {
        VStack {
            x
                .foregroundColor(Color.red)
                .font(.subheadline)
            y
                .foregroundColor(Color.green)
                .font(.largeTitle)
            z
            
        }
    }
}

struct ViewAsProperties_Previews: PreviewProvider {
    static var previews: some View {
        ViewAsProperties()
    }
}
