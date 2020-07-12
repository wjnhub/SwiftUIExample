//
//  ConditionalModifier.swift
//  ViewsAndModifiers
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct ConditionalModifier: View {
    @State private var changeColor = false
    
    var body: some View {
        Button("Hello World") {
            self.changeColor.toggle()
        }
        .frame(width: 200, height: 200)
        .background(changeColor ? Color.green : Color.yellow)
    }
}

struct ConditionalModifier_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalModifier()
    }
}
