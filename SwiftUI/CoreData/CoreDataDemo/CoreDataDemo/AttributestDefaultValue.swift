//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by wjn on 2020/7/17.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct AttributestDefaultValue: View {
    
    @FetchRequest(entity: Entity1.entity(), sortDescriptors: []) var entity1s: FetchedResults<Entity1>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        
        VStack {
            ForEach(entity1s, id: \.self) {
                Text($0.wrapperName)
            }
            
            Button("添加数据") {
                let newData = Entity1(context: self.context)
                newData.name = "哈哈哈"
                
                try? self.context.save()
            }
        }
        
    }
}

struct AttributestDefaultValue_Previews: PreviewProvider {
    static var previews: some View {
        AttributestDefaultValue()
    }
}
