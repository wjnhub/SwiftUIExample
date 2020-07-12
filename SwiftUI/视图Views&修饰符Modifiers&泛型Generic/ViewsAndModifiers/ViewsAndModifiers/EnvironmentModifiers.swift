//
//  EnvironmentModifiers.swift
//  ViewsAndModifiers
//
//  Created by wjn on 2020/7/12.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.caption)
            Text("Hello, World!")
            Text("Hello, World!")
        }
        .font(.largeTitle)
        .blur(radius: 2)
    }
}

struct EnvironmentModifiers_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentModifiers()
    }
}
