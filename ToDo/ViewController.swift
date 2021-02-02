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
        ToDoItem(text: "Задача2", isChecked: false ),
        ToDoItem(text: "Задача3", isChecked: false ),
        ToDoItem(text: "Задача4", isChecked: false ),
        ToDoItem(text: "Задача5", isChecked: false )
    ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItems.count
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ToDoCell

        
        cell.checkbox.layer.borderWidth = 2
    
        cell.checkbox.layer.borderColor = ColorSheme.checkboxBorderColor.cgColor
//        cell.checkbox.layer.borderColor = UIColor(red: 0.889415, green: 0.889436, blue:0.889424, alpha: 1.0 ).cgColor
        cell.checkbox.layer.cornerRadius = 14
        cell.checkbox.backgroundColor = UIColor.white
        cell.itemText.text = dataItems[indexPath.row].text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

