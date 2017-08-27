//
//  Model.swift
//  ToDoLIst
//
//  Created by Кирилл Дроздов on 20.08.17.
//  Copyright © 2017 Кирилл Дроздов. All rights reserved.
//

import UIKit

var pathForSaveData: String {
    let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/data.plist"
    print(path)
    return path
}

var rootItem: ToDoItem?

//MARK - create model
func loadData() {
    if let dict = NSDictionary(contentsOfFile: pathForSaveData) {
        rootItem = ToDoItem(dictionary: dict)
    }
    else {
        rootItem = ToDoItem(name: "ToDo")
    }
}
//    MARK - save data
func saveData() {
    rootItem?.dictionary.write(toFile: pathForSaveData, atomically: true) 
}
 
