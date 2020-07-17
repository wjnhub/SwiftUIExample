//
//  HasChangesAndConstraints.swift
//  CoreDataDemo
//
//  Created by wjn on 2020/7/17.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct HasChangesAndConstraints: View {
    
    @FetchRequest(entity: Entity2.entity(), sortDescriptors: []) var entity2s: FetchedResults<Entity2>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            List(entity2s, id: \.self) {
                Text($0.name ?? "无名")
            }

            Button("添加数据") {
                let newData = Entity2(context: self.context)
                newData.name = "小明"
            }

            Button("保存数据") {
                if self.context.hasChanges {
                    do {
                        try self.context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
        
    }
}

struct HasChangesAndConstraints_Previews: PreviewProvider {
    static var previews: some View {
        HasChangesAndConstraints()
    }
}
