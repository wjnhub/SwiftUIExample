//
//  RelationshipsView.swift
//  CoreDataDemo
//
//  Created by wjn on 2020/7/17.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct RelationshipsView: View {
    @FetchRequest(entity: Author.entity(), sortDescriptors: []) var authors: FetchedResults<Author>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            List {
                ForEach(authors, id: \.self) { author in
                    Section(header: Text(author.name ?? "")) {
                        ForEach(author.articles, id: \.self) {
                            Text($0.title ?? "")
                        }
                    }
                }
            }
            
            Button("添加数据") {
                self.addData(title: "我最后悔得失创建了阿里巴巴", authorName: "马云")
                self.addData(title: "我出生于普通家庭", authorName: "马化腾")
                self.addData(title: "我是真的一无所有", authorName: "王健林")
                self.addData(title: "我会打一点乒乓球", authorName: "张继科")
                
                try? self.context.save()
            }
        }
    }
    
    func addData(title: String, content: String = "xxx", authorName: String, authorAge: Int16 = 20) {
        let article = Article(context: self.context)
        article.title = title
        article.content = content
        article.author = Author(context: self.context)
        article.author?.name = authorName
        article.author?.age = authorAge
    }
}

struct RelationshipsView_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipsView()
    }
}
