//
//  ContentView.swift
//  GuessFlag
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    
    @State private var countries = ["中国", "日本", "法国", "德国", "意大利", "俄罗斯", "英国", "美国"]
    @State private var currentCountry = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack {
            // 添加一个线性渐变背景
            LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                VStack(spacing: 10) {
                    Text("以下国家的旗帜是哪一个")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    
                    Text(countries[currentCountry])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                VStack(spacing: 20) {
                    ForEach(0..<3, id: \.self) { num in
                        Button(action: {
                            self.alertTitle = num == self.currentCountry ? "答对了" : "答错了"
                            self.showAlert = true
                        }) {
                            Image(self.countries[num])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                                .shadow(color: .black, radius: 2.0 )
                        }
                    }
                }
                Spacer()
            }
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(self.alertTitle),
                  message: nil,
                  dismissButton: .default(Text("继续"), action: {
                    // 源数据重新洗牌
                    self.next()
                  }))
        }
        
    }
    
    func next() {
        countries.shuffle()
        currentCountry = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
