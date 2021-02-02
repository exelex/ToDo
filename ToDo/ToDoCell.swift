//
//  ToDoCell.swift
//  ToDo
//
//  Created by Alexey Il on 01.02.2021.
//  Copyright © 2021 Alexey Il. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var checkbox: UIButton!
    
    @IBOutlet weak var itemText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
