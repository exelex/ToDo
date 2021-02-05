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
        return dataItems[item].isChecked
    }
    
    func editItem(item: Int, text: String) {
        dataItems[item].text = text
        tableView.reloadData()
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
        
        if changeStatus(at: indexPath.row) {
            cell.checkbox.setImage(UIImage(named: "check"), for: .normal)
        } else {
            cell.checkbox.setImage(UIImage(named: "uncheck"), for: .normal)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let contextItemEdit = UIContextualAction(style: .normal, title: "Edit") {  (contextualAction, view, boolValue) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let modalEdit = storyboard.instantiateViewController(identifier: "EditViewController") as! EditViewController
            
            modalEdit.modalPresentationStyle = .pageSheet
            modalEdit.modalTransitionStyle = .coverVertical
            
            modalEdit.itemID = indexPath.row
            modalEdit.itemText = self.dataItems[indexPath.row].text
            
            self.present(modalEdit, animated: true, completion: nil)
        }
        
        contextItemEdit.backgroundColor = ColorSheme.swipeActionGreen
        
        let contextItemDelete = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            self.dataItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItemDelete, contextItemEdit])

        return swipeActions
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(gotNotification(notification:)), name: kNotifNextViewControllerCallback, object: nil)
    }

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func gotNotification(notification: Notification) {
//        let notificationText = notification.userInfo
        guard let userInfo = notification.userInfo else {return}
        if let editResultText = userInfo["text"] {
            
            if let editResultId = userInfo["id"] {
                editItem(item: editResultId as! Int, text: editResultText as! String)
            }
        }
        
        
        
        
    }
    
    
}

