//
//  RatingView.swift
//  MovieMemo
//
//  Created by wjn on 2020/7/15.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1..<6) { num in
                Image(systemName: "star.fill")
                    .foregroundColor(num > self.rating ?.gray : .yellow)
                    .onTapGesture {
                        self.rating = num
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
