//
//  ImageSaver.swift
//  WorkingWithUIKit
//
//  Created by wjn on 2020/7/17.
//  Copyright © 2020 wjn. All rights reserved.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func save(uiImage: UIImage) {
        UIImageWriteToSavedPhotosAlbum(uiImage, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, _ error: Error?, _ contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
    
    
}
