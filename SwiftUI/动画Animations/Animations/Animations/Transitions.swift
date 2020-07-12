//
//  Transitions.swift
//  Animations
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct Transitions: View {
    @State private var isShow = false
    
    var body: some View {
        VStack {
            Button("切换卡片的显示和隐藏") {
                withAnimation {
                    self.isShow.toggle()
                }
            }
            if isShow {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 200, height: 200)
                    .transition(
                        .asymmetric(
                            insertion: .scale,
                            removal: .opacity
                        )
                )
            }
            
        }
        
    }
}

struct Transitions_Previews: PreviewProvider {
    static var previews: some View {
        Transitions()
    }
}
