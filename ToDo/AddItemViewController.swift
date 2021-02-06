//
//  AddItemViewController.swift
//  ToDo
//
//  Created by Alexey Il on 06.02.2021.
//  Copyright © 2021 Alexey Il. All rights reserved.
//

import UIKit

protocol MyDataSendingDelegateProtocol {
    func addItemDelegate(text: String)
}

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var textEdit: UITextView!
    
    var delegate: MyDataSendingDelegateProtocol? = nil

    func send(text: String) {
        if self.delegate != nil {
            self.delegate?.addItemDelegate(text: text)
        }
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
        if let text = textEdit.text, !text.isEmpty {
            send(text: textEdit.text)
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // показ клавиатуры
        textEdit.isUserInteractionEnabled = true // удалены пользовательские события
        textEdit.becomeFirstResponder()
    }

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let dest = segue.destination as? ViewController {
//            dest.name = "Jessica"
//        }
//    }
}



