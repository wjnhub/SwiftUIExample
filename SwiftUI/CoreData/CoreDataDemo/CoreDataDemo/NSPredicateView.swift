//
//  NSPredicateView.swift
//  CoreDataDemo
//
//  Created by wjn on 2020/7/17.
//  Copyright © 2020 wjn. All rights reserved.
//
// NSPredicate使用事例 https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/AdditionalChapters/Introduction.html#//apple_ref/doc/uid/TP40001789

import SwiftUI

struct NSPredicateView: View {
    @Environment(\.managedObjectContext) var context
    // 1
//    @FetchRequest(entity: Entity3.entity(),
//                  sortDescriptors: [],
//                  predicate: NSPredicate(format: "name == 马云")
//    ) var entity3s: FetchedResults<Entity3>
    
    // 2
//    @FetchRequest(entity: Entity3.entity(),
//                  sortDescriptors: [],
//                  predicate: NSPredicate(format: "name == %@", "马云")
//    ) var entity3s: FetchedResults<Entity3>

    // 3
//    @FetchRequest(entity: Entity3.entity(),
//                  sortDescriptors: [],
//                  predicate: NSPredicate(format: "name in %@", ["马云", "乔布斯", "雷军"])
//    ) var entity3s: FetchedResults<Entity3>
    
    // 4
//    @FetchRequest(entity: Entity3.entity(),
//                  sortDescriptors: [],
//                  predicate: NSPredicate(format: "englishName BEGINSWITH %@", "B")
//    ) var entity3s: FetchedResults<Entity3>
    
    // 5
    @FetchRequest(entity: Entity3.entity(),
                  sortDescriptors: [],
                  predicate: NSPredicate(format: "englishName CONTAINS[c] %@", "j")
    ) var entity3s: FetchedResults<Entity3>
    
    
    var body: some View {
        VStack {
            List(entity3s, id: \.self) {entity3 in
                VStack {
                    Text(entity3.name ?? "无名")
                    Text(entity3.englishName ?? "none")
                }
            }
            
            Button("添加数据") {
                let newData1 = Entity3(context: self.context)
                newData1.name = "马云"
                newData1.englishName = "Jack Ma"
                
                let newData2 = Entity3(context: self.context)
                newData2.name = "库克"
                newData2.englishName = "Cook"
                
                let newData3 = Entity3(context: self.context)
                newData3.name = "李小龙"
                newData3.englishName = "Bruce Lee"
                
                try? self.context.save()
            }
        }
    }
}

struct NSPredicateView_Previews: PreviewProvider {
    static var previews: some View {
        NSPredicateView()
    }
}
