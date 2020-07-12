//
//  AboutModifierOrder.swift
//  ViewsAndModifiers
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct AboutModifierOrder: View {
    var body: some View {
        VStack {
            // 顺序不同效果不同
            Text("Hello, World!")
                .frame(width: 200, height: 200)
                .background(Color.green)
            
            Text("Hello, World!")
                .background(Color.green)
                .frame(width: 200, height: 200)
            
            Text("Hello, World!")
                .padding()
                .background(Color.green)
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.blue)
        }
        
    }
}

struct AboutModifierOrder_Previews: PreviewProvider {
    static var previews: some View {
        AboutModifierOrder()
    }
}
