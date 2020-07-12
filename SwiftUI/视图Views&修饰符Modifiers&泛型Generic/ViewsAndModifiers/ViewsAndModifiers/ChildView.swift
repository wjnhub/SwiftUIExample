//
//  ChildView.swift
//  ViewsAndModifiers
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct ChildView: View {
    var body: some View {
        VStack(spacing: 20) {
            CapsuleText(text: "子视图1")
                .foregroundColor(.white)
            
            CapsuleText(text: "子视图2")
                .foregroundColor(.yellow)
        }
    }
}

// 实际开发中该view单独生成文件编写
struct CapsuleText: View {
    
    let text: String
    
    var body: some View {
        Text(text)
        .font(.largeTitle)
        .padding()
        .background(Color.blue)
        .clipShape(Capsule())
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView()
    }
}
