//
//  AddMovieView.swift
//  MovieMemo
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct AddMovieView: View {
    // 被托管对象的上下文
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var typeInde = 2
    @State private var review = ""
    @State private var rating = 3
    
    let types = ["科幻", "恐怖", "喜剧", "动画", "剧情", "爱情", "悬疑"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("电影名", text: $name)
                    
                    Picker("类型", selection: $typeInde) {
                        ForEach(types.indices, id: \.self) {
                            Text(self.types[$0])
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    TextField("点评", text: $review)
                }
                
                Section {
                    Button("提交") {
                        let newMovie = Movie(context: self.context)
                        newMovie.id = UUID()
                        newMovie.name = self.name
                        newMovie.type = self.types[self.typeInde]
                        newMovie.rating = Int16(self.rating)
                        newMovie.review = self.review
                        
                        try? self.context.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }.disabled(self.name.isEmpty || self.review.isEmpty)
                }
            }
        }
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
