//
//  ContentView.swift
//  MovieMemo
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @State private var sheetShow = false
    
    @FetchRequest(entity: Movie.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Movie.rating, ascending: false)]
    ) var movies: FetchedResults<Movie>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movies, id: \.id) { movie in
                    NavigationLink(destination:
                        DeatilView(movie: movie)
                            .environment(\.managedObjectContext, self.context)
                    ) {
                        EmojiRatingView(rating: movie.rating)
                        VStack(alignment: .leading, spacing: 10) {
                            Text(movie.name ?? "无名电影")
                                .font(.headline)
                            Text(movie.type ?? "喜剧")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteMovies)
            }
            .navigationBarTitle("看过的电影")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                    self.sheetShow = true
                }) {
                    Image(systemName: "plus")
                }
            ).sheet(isPresented: $sheetShow) {
                AddMovieView()
                    .environment(\.managedObjectContext, self.context)
            }
        }
    }
    
    func deleteMovies(indexSet: IndexSet) {
        for index in indexSet {
            context.delete(movies[index])
        }
        try? context.save()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
