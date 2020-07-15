//
//  AstronautView.swift
//  ShenZhou
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let name: String

    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    var astronaut: Astronaut {
        astronauts.first(where: {$0.name == self.name})!
    }
    
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                Image(self.astronaut.name)
                    .resizable().scaledToFit()
                    .frame(width: geometryProxy.size.width)
                
                Text(self.astronaut.name)
                .padding()
            }
            
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautView(name: "翟志刚")
    }
}
