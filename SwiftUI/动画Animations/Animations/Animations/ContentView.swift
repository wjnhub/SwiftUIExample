//
//  ContentView.swift
//  Animations
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount: CGFloat = 1
    @State private var amount2: CGFloat = 1
    
    var body: some View {
        VStack(spacing: 40) {
            // 隐式动画
            Button("点我") {
                self.amount += 1
            }
            .foregroundColor(.white)
            .padding(30)
            .background(Color.black)
            .clipShape(Circle()) // 裁剪圆形
            .scaleEffect(amount) // 放大
            .blur(radius: amount - 1) // 添加模糊效果
            .animation(.default) // 简单动画
            
            // 隐式动画 -- 进阶
            Button("抢红包") {
                
            }
            .foregroundColor(.white)
            .padding(30)
            .background(Color.red)
            .clipShape(Circle())
            .shadow(radius: 5)
            .overlay(
                Circle()
                    .stroke(Color.red, lineWidth: 1)
                    .scaleEffect(amount2)
                    .opacity(Double(2 - amount2))
                    .animation(
                        Animation.easeOut(duration: 1.0)
                            .repeatForever(autoreverses: false)
                        //  .repeatCount(5, autoreverses: false)
                )
                
            )
                .onAppear {
                    self.amount2 = 2
            }
            

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
