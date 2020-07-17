//
//  Entity1+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by wjn on 2020/7/17.
//  Copyright © 2020 wjn. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity1> {
        return NSFetchRequest<Entity1>(entityName: "Entity1")
    }

    @NSManaged public var name: String?
    
    public var wrapperName: String {
        name ?? "无名"
    }

}
