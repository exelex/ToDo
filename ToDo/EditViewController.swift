//
//  EditViewController.swift
//  ToDo
//
//  Created by Alexey Il on 04.02.2021.
//  Copyright © 2021 Alexey Il. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    
    var imageName: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text = "Img name \(imageName)"
        
//        view.backgroundColor  = .white
        print("open edit modal")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
