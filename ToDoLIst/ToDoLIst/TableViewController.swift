//
//  TableViewController.swift
//  ToDoLIst
//
//  Created by Кирилл Дроздов on 20.08.17.
//  Copyright © 2017 Кирилл Дроздов. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var todoItemCurrent: ToDoItem?

    @IBAction func pushAddAction(_ sender: Any) {
        
        let alert =  UIAlertController(title: "Create new Item", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "ToDo Item"
        }
        
        let alertActionCreate = UIAlertAction(title: "Create", style: UIAlertActionStyle.default) { (alertAction) in
            
            if alert.textFields![0].text != "" {
                let newItem = ToDoItem(name: alert.textFields![0].text!)
                
                self.todoItemCurrent?.addSubItem(subItem: newItem)
            
                saveData()
                self.tableView.reloadData()
            }
            
        }
        
        let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (alert) in
            
        }
        
        alert.addAction(alertActionCreate)
        alert.addAction(alertActionCancel)
        
        present(alert, animated: true, completion: nil)
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if todoItemCurrent == nil {
            todoItemCurrent = rootItem;
        }
        
        navigationItem.title = todoItemCurrent?.name

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (todoItemCurrent?.subItems.count)! 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let itemForCell = todoItemCurrent!.subItems[indexPath.row];
        
        cell.textLabel?.text  = itemForCell.name
        
        if  itemForCell.subItems.count != 0 {
            cell.detailTextLabel?.text = "\(String(itemForCell.subItems.count)) Subitems"
        }
        else {
           cell.detailTextLabel?.text = ""
        }

        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subItem = todoItemCurrent?.subItems[indexPath.row]
       let tvc = storyboard?.instantiateViewController(withIdentifier: "todoSID") as! TableViewController
        tvc.todoItemCurrent = subItem
        
        navigationController?.pushViewController(tvc, animated: true)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            todoItemCurrent?.removeSubItems(index: indexPath.row)
            
            saveData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
