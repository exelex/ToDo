//
//  EditViewController.swift
//  ToDo
//
//  Created by Alexey Il on 04.02.2021.
//  Copyright © 2021 Alexey Il. All rights reserved.
//

import UIKit

let kNotifNextViewControllerCallback = NSNotification.Name(rawValue: "kNotifNextViewControllerCallback")


class EditViewController: UIViewController {
    
    @IBOutlet weak var textEdit: UITextView!
    
    var itemText: String = ""
    var itemID: Int = 0
    lazy var itemTextEdit: String = textEdit.text
    
    
    lazy var editData = ["text": itemTextEdit, "id": itemID] as [String : Any]

    func editResult() {
        NotificationCenter.default.post(name: kNotifNextViewControllerCallback, object: "notification text", userInfo: editData)
    }
    
    @IBAction func editViewCancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editViewDone(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        editResult()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textEdit.text = itemText
        
        // показ клавиатуры
        textEdit.isUserInteractionEnabled = true // удалены пользовательские события
        textEdit.becomeFirstResponder()
    }

}



