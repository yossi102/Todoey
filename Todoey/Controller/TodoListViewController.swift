//
//  ViewController.swift
//  Todoey
//
//  Created by Yos bz on 04/05/2020.
//  Copyright © 2020 Yos bz. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    var itemArrey = [Item]()
    
    let defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        
        
        print(dataFilePath!)
        
        super.viewDidLoad()
        
//        loadItems()
        
        
//        let newItme = Item()
//        newItme.title = "Find Mike"
//        itemArrey.append(newItme)
//
//        let newItme2 = Item()
//        newItme2.title = "Buy Eggos"
//        itemArrey.append(newItme2)
//
//        let newItme3 = Item()
//        newItme3.title = "Destroy Demogorgon"
//        itemArrey.append(newItme3)
//        saveItems()
        
        //
        //                if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
        //                    itemArrey = items
        //                }
    }
    
    //MARK Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArrey.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArrey[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        
        return cell
    }
    
    //MARK Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArrey[indexPath.row].done = !itemArrey[indexPath.row].done
        saveItems()
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtenPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks the add item button
            
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            self.itemArrey.append(newItem)
            
            //            self.defaults.set(self.itemArrey, forKey: "TodoListArray")
            
            self.saveItems()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat new Item"
            textField = alertTextField
        }
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
    
    //MARK - Model Manupulation Methods
    
    func saveItems() {
                
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        self.tableView.reloadData()
    }
    
//    func loadItems() {
//
//        if let data = try? Data(contentsOf: dataFilePath!) {
//
//            let decoder = PropertyListDecoder()
//            do {
//                itemArrey = try decoder.decode([Item].self, from: data)
//            } catch {
//                print(error)
//            }
//        }
//    }
}

