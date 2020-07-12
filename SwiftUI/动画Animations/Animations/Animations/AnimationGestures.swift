//
//  AnimationGestures.swift
//  Animations
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
// 手势动画

import SwiftUI

struct AnimationGestures: View {
    @State private var dragOffset: CGSize = .zero
    @State private var dragOffset2: CGSize = .zero
    @State private var enabled = false
    
    let letters = Array("我的名字叫wjn,不要打我啊")
    
    var body: some View {
        VStack(spacing: 30) {
            LinearGradient(
                gradient: Gradient(colors: [.yellow, .red]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ self.dragOffset = $0.translation })
                        .onEnded({_ in
                            withAnimation(.spring()) {
                                self.dragOffset = .zero
                            }
                        })
            )
            
            HStack(spacing: 0) {
                ForEach(letters.indices, id: \.self) { index in
                    Text(String(self.letters[index]))
                        .font(.title)
                        .foregroundColor(.white)
                        .background(self.enabled ? Color.red : Color.orange)
                        .offset(self.dragOffset2)
                        .animation(Animation.default.delay(Double(index) / 20))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged({ self.dragOffset2 = $0.translation })
                    .onEnded({_ in
                        self.dragOffset2 = .zero
                        self.enabled.toggle()
                    })
            )
            
        }
        
        
    }
}

struct AnimationGestures_Previews: PreviewProvider {
    static var previews: some View {
        AnimationGestures()
    }
}
