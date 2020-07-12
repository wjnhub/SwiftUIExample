//
//  AnimationBindings.swift
//  Animations
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
// 绑定动画

import SwiftUI

struct AnimationBindings: View {
    @State private var amount: CGFloat = 1
    
    var body: some View {
        VStack(spacing: 100) {
            Stepper("缩放下图",
                    value: $amount.animation(
                        Animation.easeInOut(duration: 1.0)
                            .repeatCount(3)
            ), in: 1...3)
                .padding(.horizontal)
            
            Button("动画绑定") {
                
            }
            .padding(40)
            .foregroundColor(.white)
            .background(Color.black)
            .clipShape(Circle())
            .shadow(radius: 5)
            .scaleEffect(amount)
        }
    }
}

struct AnimationBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBindings()
    }
}
