//
//  ViewController.swift
//  ToDo
//
//  Created by Alexey Il on 29.01.2021.
//  Copyright © 2021 Alexey Il. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var dataItems: [ToDoItem] = [
        ToDoItem(text: "Задача1 dfad fsdf asfd dfasdfsdf sfsd dsfs", isChecked: false ),
        ToDoItem(text: "Задача2", isChecked: true ),
        ToDoItem(text: "Задача3", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача5", isChecked: false )
    ]
    
    func changeStatus(at item: Int)  -> Bool {
        dataItems[item].isChecked = !(dataItems[item].isChecked)
        print(dataItems[item].isChecked)
        return dataItems[item].isChecked
    }
    
    @IBAction func buttonOpenModal(_ sender: Any) {
        let modalEdit = EditViewController()
        self.present(modalEdit, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItems.count
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ToDoCell

        cell.checkbox.backgroundColor = UIColor.white
        cell.checkbox.layer.cornerRadius = 14
        cell.checkbox.setImage(UIImage(named: "uncheck"), for: .normal)
        
        
        
        cell.itemText.text = dataItems[indexPath.row].text
        
        if (dataItems[indexPath.row].isChecked == true) {
            cell.checkbox.setImage(UIImage(named: "check"), for: .normal)
        } else {
            cell.checkbox.setImage(UIImage(named: "uncheck"), for: .normal)
        }
        
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! ToDoCell
        
    
        let item = self.tableView.cellForRow(at: indexPath)
        
    
        
        if changeStatus(at: indexPath.row) {
            cell.checkbox.setImage(UIImage(named: "check"), for: .normal)
        } else {
            cell.checkbox.setImage(UIImage(named: "uncheck"), for: .normal)
        }
        
//        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

