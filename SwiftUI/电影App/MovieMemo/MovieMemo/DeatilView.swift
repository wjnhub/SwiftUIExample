//
//  DeatilView.swift
//  MovieMemo
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI
import CoreData

struct DeatilView: View {
    
    @State private var showAlert = false
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    let movie: Movie
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.movie.type ?? "喜剧")
                        .frame(maxWidth: geo.size.width)
                    Text(self.movie.type ?? "喜剧")
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .font(.caption)
                        .padding(8)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                
                
                Text(self.movie.review ?? "没有点评").padding()
                
                RatingView(rating: .constant(Int(self.movie.rating)))
                    .font(.largeTitle)
                
                Spacer()
                
            }
        }
        .navigationBarTitle(Text(self.movie.name ?? "无名电影"), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.showAlert.toggle()
            }){
                Image(systemName: "trash")
            }
        )
            .alert(isPresented: $showAlert) {
                Alert(title: Text("删除电影"),
                      message: Text("确认删除吗"),
                      primaryButton: .destructive(Text("确认"), action: {
                        self.deleteMovie()
                      }),
                      secondaryButton: .cancel(Text("取消")))
        }
    }
    
    func deleteMovie() {
        context.delete(movie)
        try? context.save()
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct DeatilView_Previews: PreviewProvider {
    
    static let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let movie = Movie(context: context)
        movie.id = UUID()
        movie.name = "唐人街探案3"
        movie.type = "喜剧"
        movie.rating = 4
        movie.review = "还不错"
        
        return DeatilView(movie: movie)
    }
}
