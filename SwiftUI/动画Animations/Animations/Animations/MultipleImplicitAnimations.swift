//
//  MultipleImplicitAnimations.swift
//  Animations
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
// 多个隐式动画

import SwiftUI

struct MultipleImplicitAnimations: View {
    @State private var enabled = false
    
    var body: some View {
        Button("点我") {
            self.enabled.toggle()
        }
        .foregroundColor(.white)
        .font(.largeTitle)
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.green)
        .animation(.default)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct MultipleImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        MultipleImplicitAnimations()
    }
}
