//
//  ContentView.swift
//  WorkingWithUIKit
//
//  Created by wjn on 2020/7/17.
//  Copyright © 2020 wjn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var image: Image?
    @State private var uiImage: UIImage?
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                if image != nil {
                    image?.resizable()
                    .scaledToFit()
                } else {
                    Button("选择图片") {
                        self.showSheet = true
                    }
                }
            }
        .navigationBarTitle("SwiftUI和UIKit")
            .sheet(isPresented: $showSheet, onDismiss: converUIImage) {
                ImagePickerView(uiImage: self.$uiImage)
            }
            .navigationBarItems(trailing: Button("保存"){
                guard let uiImage = self.uiImage else { return }
                let imageSaver = ImageSaver()
                imageSaver.successHandler = {
                    print("保存成功")
                }
                imageSaver.errorHandler = { error in
                    print(error.localizedDescription)
                }
            
                imageSaver.save(uiImage: uiImage)
            })
        }
    }
    
    func converUIImage() {
        guard let uiImage = uiImage else { return }
        image = Image(uiImage: uiImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
