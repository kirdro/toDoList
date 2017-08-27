
//
//  toDoItem.swift
//  ToDoLIst
//
//  Created by Кирилл Дроздов on 20.08.17.
//  Copyright © 2017 Кирилл Дроздов. All rights reserved.
//

import UIKit

class ToDoItem {
    
    var name: String
    var isComplite: Bool
    
    var subItems: [ToDoItem]
    
    init(name: String) {
        self.name = name;
        self.isComplite = false;
        
        self.subItems = [];
    }
    
    init(dictionary: NSDictionary) {
        self.name = dictionary.object(forKey: "name") as! String
        self.isComplite = dictionary.object(forKey: "isComplite") as! Bool
        self.subItems = []
        
        let arraySubitems = dictionary.object(forKey: "arraySubItems") as! NSArray
        for subTodoDict in arraySubitems {
            self.subItems.append(ToDoItem(dictionary: subTodoDict as! NSDictionary))
        }
        
    }
    
    var dictionary: NSDictionary {
        
        var arraySubItems = NSArray();
        for subItem in subItems {
            arraySubItems = arraySubItems.adding(subItem.dictionary) as NSArray
        }
        
        let dictionary = NSDictionary(objects: [name, isComplite, arraySubItems], forKeys: ["name" as NSCopying, "isComplite" as NSCopying, "arraySubItems" as NSCopying])
        return dictionary;
    }
    
    func addSubItem(subItem: ToDoItem) {
        subItems.append(subItem)
    }
    
    func removeSubItems(index: Int) {
        subItems.remove(at: index)
    }
}
