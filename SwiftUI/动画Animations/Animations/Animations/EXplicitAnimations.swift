//
//  EXplicitAnimations.swift
//  Animations
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
// 指定动画

import SwiftUI

struct EXplicitAnimations: View {
    
    @State private var amount = 0.0
    
    var body: some View {
        Button("点我") {
            // 指定动画发生条件
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.amount += 360
            }
        }
        .padding(50)
        .foregroundColor(.white)
        .background(Color.black)
        .shadow(radius: 5)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(amount), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}

struct EXplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        EXplicitAnimations()
    }
}
