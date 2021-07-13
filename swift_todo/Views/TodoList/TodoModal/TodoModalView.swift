//
//  TodoModalView.swift
//  swift_todo
//
//  Created by tk84 on 2021/07/12.
//

import UIKit

class TodoModalView: UIView {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    class func instance() -> TodoModalView {
        return UINib(nibName: "TodoModalView",
                     bundle: nil).instantiate(
                        withOwner: self,
                        options: nil)[0] as! TodoModalView
    }
    
    
}
