//
//  TodoCellView.swift
//  swift_todo
//
//  Created by tk84 on 2021/07/11.
//

import UIKit

protocol TodoCellViewDelegate: AnyObject {
    func todoCellViewChecked(_ cell: TodoCellView, didChange sender: Any)
}

class TodoCellView: UITableViewCell {
    var delegate: TodoCellViewDelegate?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var checkBox: UIButton!
    
    @IBAction func chengeCheckBox(_ sender: Any) {
        delegate?.todoCellViewChecked(self, didChange: sender)
    }
}

