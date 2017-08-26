
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
    
    func addSubItem(subItem: ToDoItem) {
        subItems.append(subItem)
    }
}
